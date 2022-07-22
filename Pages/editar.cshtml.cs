using Microsoft.AspNetCore.Mvc;
using Server;
using Grpc.Net.Client;
using TFCApplication.Models;
using Grpc.Core;
using Microsoft.AspNetCore.Mvc.RazorPages;

using Microsoft.AspNetCore.Authorization;

namespace TFCApplication.Pages
{
    [Authorize(Roles = "Admin")]
    public class editarModel : PageModel
    {
        [BindProperty]
        public string numero { get; set; }

        [BindProperty]
        public string name { get; set; }

        [BindProperty]
        public string novamatricula { get; set; }

        [BindProperty]
        public string pagoDesde { get; set; } = "";

        [BindProperty]
        public string pagoAte { get; set; } = "";

        public static string tipoUser;

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
                tipoUser = resposta.TipoUser;
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
    
        
        public IActionResult OnPostEditar()
        {
            try
            {
                var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
                DadosUser dados = new DadosUser { TipoUser = tipoUser, Login = numero, Nome = name, ContaAtivada = (contaAtiva == "Sim") };
                DadosPermEntrada dados2 = new DadosPermEntrada {Login = numero, PagoDesde = pagoDesde, PagoAte = pagoAte, ParqueGratis = (parqueGratis == "Sim")};
                cliente.EditUser(dados);
                cliente.EditEntryPermition(dados2);
            
                return RedirectToPage("/utilizador");
            }
            catch
            {
                Console.WriteLine("server not found");
            }
            return RedirectToPage("/utilizador");
        }
        

        public IActionResult OnPostAdicionar()
        {
            var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
            DadosAuto dados = new DadosAuto { Login = numero, Matricula = novamatricula };
            cliente.InsertMatricula(dados);

            return Redirect($"/editar?id={numero}");
        }
    }
}
