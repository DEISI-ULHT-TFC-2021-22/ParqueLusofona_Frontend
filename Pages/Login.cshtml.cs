using Server;
using Grpc.Net.Client;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TFCApplication.Models;

namespace TFCApplication.Pages
{

    public class LoginModel : PageModel
    {

        [BindProperty]
        public UtilizadorModel Utilizadores { get; set; }

        LoginAutorization resposta = new LoginAutorization();
        private GrpcChannel channel = GrpcChannel.ForAddress(@"https://localhost:7025");

        public void OnGet()
        {

        }

        public IActionResult OnPost()
        {
            var cliente = new Login.LoginClient(channel);
            var input = new LoginData { Login = Utilizadores.username, Password = Utilizadores.password };

            try
            {
                resposta = cliente.LoginRequest(input);

                if (resposta.LoginEfetuado)
                {
                    return RedirectToPage("/Index", new { Utilizadores.username });
                }
                return Page();
            }
            catch
            {
                Console.WriteLine("server not found");
            }

            return Page();

        }
    }

   
}
