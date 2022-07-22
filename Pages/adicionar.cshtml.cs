using Microsoft.AspNetCore.Mvc;
using Server;
using Grpc.Net.Client;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using System.Security.Cryptography;
using System.Text;

namespace TFCApplication.Pages
{
    [Authorize(Roles = "Admin")]
    public class adicionarModel : PageModel
    {
        private readonly static string key = "tfc_2022_frontend_daniel_manuel1";

        [BindProperty]
        public string login { get; set; }
        [BindProperty]
        public string name{ get; set; }
        [BindProperty]
        public string password { get; set; }
        [BindProperty]
        public string matricula { get; set; }

        [BindProperty]
        public static string pagoDesde { get; set; } = "";

        [BindProperty]
        public static string pagoAte { get; set; } = "";

        [BindProperty]
        public string parqueGratis { get; set; }

        [BindProperty]
        public string tipoUser { get; set; }


        public void OnGet()
        {
           
        }
        public static string Encrypt(string password)
        {
            byte[] iv = new byte[16];
            byte[] array;
            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);
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
        public IActionResult OnPost()
        {

            try
            {
                //TO DO
                //resposta = cliente.AdicionarUser();
                var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
                DadosUserInsert dados = new DadosUserInsert { TipoUser = tipoUser, Login = login, Nome = name, Password = Encrypt(password),ContaAtivada = true };
                DadosPermEntrada dados2 = new DadosPermEntrada { Login = login, PagoDesde = pagoDesde, PagoAte = pagoAte, ParqueGratis = (parqueGratis == "Sim") };
                cliente.InsertUser(dados);
                DadosAuto dadosMatricula = new DadosAuto { Login = login, Matricula = matricula };
                cliente.InsertMatricula(dadosMatricula);
                cliente.InsertEntryPermition(dados2);


                return RedirectToPage("/utilizador");
            }
            catch
            {
                Console.WriteLine("server not found");
            }
            return null;
        }
    }
}
