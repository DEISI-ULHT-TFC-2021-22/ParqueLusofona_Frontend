using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TFCApplication.Models;

namespace TFCApplication.Pages
{
    
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        [BindProperty(SupportsGet = true)]
        public string Matricula { get; set; }

        [BindProperty]
        public MatriculaModel matriculas { get; set; }

        public static string matricula = null;

        public void OnPostRevalidar()
        {
            Matricula = matriculas.matricula;
            matricula = matriculas.matricula;
        }
        public void OnPostLimpar()
        {
            Matricula = null;
            matricula = null;
        }
        public void OnGet()
        {
           
        }
    }
}