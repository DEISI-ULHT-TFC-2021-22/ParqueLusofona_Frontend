using Server;
using Grpc.Net.Client;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TFCApplication.Models;
using System.Security.Cryptography;
using System.Text;

namespace TFCApplication.Pages
{

    public class LoginModel : PageModel
    {
        private readonly static string key = "tfc_2022_frontend_daniel_manuel1";

        [BindProperty]
        public  UtilizadorModel Utilizadores { get; set; }

        public UtilizadorModel utilizadorLogado = new UtilizadorModel();

        [BindProperty]
        public  string errorText { get; set; }  = "";


        LoginAutorization resposta = new LoginAutorization();

        private GrpcChannel channel = GrpcChannel.ForAddress(@"https://localhost:7025");

        public async Task<IActionResult> OnGet()
        {
            await new LoginService().LogOffUser(HttpContext);
            return Page();
        }
        public static string Encrypt(string password)
        {
            byte[] iv = new byte[16];
            byte[] array;
            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key,aes.IV);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)ms, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter streamWriter = new StreamWriter((Stream)cryptoStream))
                        {
                            streamWriter.Write(password);
                        }
                        array = ms.ToArray();
                    }
                }
            }
                  return Convert.ToBase64String(array);
        }
        public async Task<IActionResult> OnPost()
        {
            var cliente = new Login.LoginClient(channel);
            var input = new LoginData { Login = Utilizadores.username, Password = Encrypt(Utilizadores.password) };

            try
            {
                resposta = cliente.LoginRequest(input);

                if (resposta.LoginEfetuado && (resposta.TipoUser == "Admin" || resposta.TipoUser == "Segurança"))
                {
                    errorText = "";
                    utilizadorLogado = new UtilizadorModel(Utilizadores.username, Utilizadores.password, resposta.TipoUser);
                    await new LoginService().LoginUser(HttpContext, utilizadorLogado);
                    return Redirect("/Index");
                    
                }
                errorText = "As credenciais introduzidas estão erradas! Introduza novamente!";
                return Page();
            }
            catch
            {
                Console.WriteLine("server not found");
            }
            errorText = "As credenciais introduzias estão erradas! Introduza novamente!";
            return Page();

        }
    }

   
}
