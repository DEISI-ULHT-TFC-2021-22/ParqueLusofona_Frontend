using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using TFCApplication.Models;
using Server;
using Grpc.Net.Client;
using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
namespace TFCApplication.Pages
{
    [Authorize(Roles = "Admin")]
    public class utilizadorModel : PageModel
    {
    public String userId = "";
    public String searchUserId = "";
    public List<UsersModel> users = new List<UsersModel>();
    public List<UsersModel> usersShow = new List<UsersModel>();
    public Web.WebClient cliente = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025"));
    public AsyncServerStreamingCall<DadosUser> resposta = new Web.WebClient(GrpcChannel.ForAddress(@"https://localhost:7025")).GetAllUsers(new Nothing { });

    

    public async Task<IActionResult> OnGet()
    {
        
        var newUsers = new List<UsersModel>();

        await foreach (var user in resposta.ResponseStream.ReadAllAsync().ConfigureAwait(false))
        {
            users.Add(new UsersModel(user.Login, user.Nome));
        }
                if(!(@HttpContext.Request.Query["searchUserId"].ToString() == null || @HttpContext.Request.Query["searchUserId"].ToString() == ""))
                {
                  foreach(var user in users)
                {
                    if (user.numero.Equals(@HttpContext.Request.Query["searchUserId"].ToString()))
                    {
                        usersShow.Add(user);
                    }
                }
            }
            else
            {
            usersShow = users;
            }
       
        return Page();
    }

    public IActionResult OnPost()
    {
        return RedirectToPage("/adicionar");
    }

    }
}
