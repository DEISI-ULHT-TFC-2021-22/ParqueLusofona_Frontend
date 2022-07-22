using Microsoft.AspNetCore.Mvc;
using Grpc.Core;
using Server;
using System.Data;
using Grpc.Net.Client;
using TFCApplication.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;

namespace TFCApplication.Pages
{
    [Authorize(Roles = "Admin")]
    public class detailModel : PageModel
    {
        [BindProperty]
        public string numero { get; set; }

        [BindProperty]
        public string name { get; set; }

        [BindProperty]
        public string novamatricula { get; set; }

        [BindProperty]
        public string pagoDesde { get; set; }

        [BindProperty]
        public string pagoAte { get; set; }

        [BindProperty]
        public string parqueGratis { get; set; }
        [BindProperty]
        public string contaAtiva { get; set; }

        public List<string> matriculasString = new List<string>();

        DadosUser resposta = new DadosUser();
        DadosPermEntrada resposta2 = new DadosPermEntrada();
        private GrpcChannel channel = GrpcChannel.ForAddress(@"https://localhost:7025");
        public async Task<IActionResult> OnGet()
        {
            var cliente = new Web.WebClient(channel);

            var input = new User { Login = @HttpContext.Request.Query["id"].ToString() };

            try
            {
                resposta = cliente.SearchUser(input);
                resposta2 = cliente.GetEntryPermitionData(input);

                if (resposta2.ParqueGratis)
                {
                    parqueGratis = "Sim";
                }
                else
                {
                    parqueGratis = "Não";
                }
                numero = resposta.Login;
                pagoDesde = resposta2.PagoDesde.Split(' ')[0];
                pagoAte = resposta2.PagoAte.Split(' ')[0];
                name = resposta.Nome;
                if (resposta.ContaAtivada)
                {
                    contaAtiva = "Sim";
                }
                else
                {
                    contaAtiva = "Não";
                }

                var matriculas = cliente.GetAllMatriculas(input);
                await foreach (var matricula in matriculas.ResponseStream.ReadAllAsync().ConfigureAwait(false))
                {
                    matriculasString.Add(matricula.Matricula);
                }
            }
            catch
            {
                Console.WriteLine("server not found");
            }
            return Page();
        }

    }
}
