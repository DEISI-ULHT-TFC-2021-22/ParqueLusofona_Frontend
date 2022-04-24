using Microsoft.AspNetCore.Mvc;
using TFCApplication.Models;
namespace TFCApplication.Users
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            List<UsersModel> users = new List<UsersModel>();
            users.Add(new UsersModel("a21901256", "Daniel Rocha", "917263748", "Sim"));
            users.Add(new UsersModel("a21907715", "Manuel Sousa", "911267845", "Não"));
            users.Add(new UsersModel("a21906568", "Daniel Rocha", "919623453", "Sim"));
            users.Add(new UsersModel("a21903453", "Daniel Rocha", "963567436", "Não"));
            users.Add(new UsersModel("a21908754", "Daniel Rocha", "925123532", "Não"));
            users.Add(new UsersModel("a21909764", "Daniel Rocha", "937623452", "Sim"));
            return View("utilizador",users);
        }
    }
}
