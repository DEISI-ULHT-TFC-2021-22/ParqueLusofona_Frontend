using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TFCApplication.Models;
using Microsoft.AspNetCore.Authorization;
using Server;
using Grpc.Net.Client;

namespace TFCApplication.Pages
{
    [Authorize(Roles = "Admin,Segurança")]
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }


        [BindProperty]
        public MatriculaModel matriculas { get; set; }

        [BindProperty]
        public string searchUser { get; set; }
        [BindProperty]
        public string SearchUserMatricula { get; set; }

        [BindProperty]
        public string username { get; set; }
        [BindProperty]
        public MatriculaModel matriculasSaida { get; set; }

        [BindProperty]
        public static string numeroEntrada { get; set; } = "________";

        [BindProperty]
        public static string numeroSaida { get; set; } = "________";

        [BindProperty]
        public static string matricula { get; set; } 

        [BindProperty]
        public static string imagem { get; set; } = "/lib/images/carro.jpg";

        [BindProperty]
        public static string validacao { get; set; } = "________";

        [BindProperty]
        public static string matriculaSaida { get; set; } 

        [BindProperty]
        public static string imagemSaida { get; set; } = "/lib/images/carro.jpg";

        [BindProperty]
        public static string validacaoSaida { get; set; } = "________";
        [BindProperty]
        public static bool podeEntrar { get; set; }

        [BindProperty]
        public static bool podeSair { get; set; }

        public void OnGet()
        {
      
        }
        public IActionResult OnPostRevalidar()
        {
            matricula = matriculas.matricula;
            var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
            DadosAuto dados = new DadosAuto { Login = numeroEntrada, Matricula = matricula };
            var resposta = cliente.PlateRevalidation(dados);
            if (Boolean.Parse(resposta.Resposta))
            {
                validacao = "Válida";
            }
            else
            {
                validacao = "Inválida";
            }
            return RedirectToPage("/Index");
        }
        public IActionResult OnPostLimpar()
        {
            if (podeEntrar) { 
            var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
            DadosAuto dados = new DadosAuto { Login = numeroEntrada, Matricula = matricula };
                cliente.RegisterEntry(dados);
            }
            numeroEntrada = "________"; 
            matricula = null;
            imagem = "/lib/images/carro.jpg";
            validacao = "________";
            podeEntrar = false;
            
            
            return RedirectToPage("/Index");
        }
        public IActionResult OnPostRevalidarSaida()
        {
            matriculaSaida = matriculasSaida.matricula;
            var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
            DadosAuto dados = new DadosAuto { Login = numeroSaida, Matricula = matriculaSaida };
            var resposta = cliente.PlateRevalidation(dados);
            if (Boolean.Parse(resposta.Resposta))
            {
                validacaoSaida = "Válida";
            }
            else
            {
                validacaoSaida = "Inválida";
            }
            return RedirectToPage("/Index");
        }
        public IActionResult OnPostLimparSaida()
        {
            if (podeSair) {
            var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
            DadosAuto dados = new DadosAuto { Login = numeroSaida, Matricula = matriculaSaida };
            cliente.RegisterExit(dados);
            }
            numeroSaida = "________";
            matriculaSaida = null;
            imagemSaida = "/lib/images/carro.jpg";
            validacaoSaida = "________";
            podeSair = false;
            
            return RedirectToPage("/Index");
        }

        public IActionResult OnPostSearchUser()
        {
           if(SearchUserMatricula != null) { 
           var cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
           ListaMatriculas matricula = new ListaMatriculas { Matricula = SearchUserMatricula };
           var resposta = cliente.SearchMatricula(matricula);

           username = resposta.Login + " - " + resposta.Nome;
                }
            return Page();
        }

        public IActionResult OnPostCleanUser()
        {
            username = "";
            return Page();
        }


        public static void setMatricula(string newMatricula, string newImagem, string newValidacao, string user, bool newPodeEntrar)
        {
            numeroEntrada = user;
            matricula = newMatricula;
            imagem = @"http://localhost/imagens/" + newImagem;
            podeEntrar = newPodeEntrar;
            if (newPodeEntrar)
            {
                validacao = "Válida";
            }
            else
            {
                validacao = "Inválida";
            }

        }
        public static void setMatriculaSaida(string newMatricula, string newImagem, string newValidacao, string user, bool newPodeSair)
        {
            numeroSaida = user;
            matriculaSaida = newMatricula;
            imagemSaida = @"http://localhost/imagens/" + newImagem;
            podeSair = newPodeSair;
            if (newPodeSair)
            {
                validacaoSaida = "Válida";
            }
            else
            {
                validacaoSaida = "Inválida";
            }
        }
    }
}