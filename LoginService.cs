using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;
using TFCApplication.Models;

namespace TFCApplication
{
    public class LoginService
    {
        public async Task LoginUser(HttpContext ctx,UtilizadorModel user)
        {
            var claims = new List<Claim>();
            claims.Add(new Claim(ClaimTypes.Name, user.username));
            claims.Add(new Claim(ClaimTypes.Role, user.UserTipo));
            var claimsIdentity =
                new ClaimsPrincipal(
                    new ClaimsIdentity(
                       claims,
                       CookieAuthenticationDefaults.AuthenticationScheme
                        )
                    );
            var authProperties = new AuthenticationProperties
            {
                ExpiresUtc = DateTime.Now.AddHours(8),
                IssuedUtc = DateTime.Now
            };
            await ctx.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimsIdentity, authProperties);
        }
        public async Task LogOffUser(HttpContext ctx)
        {
            await ctx.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        }
    }
}
