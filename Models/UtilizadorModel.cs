namespace TFCApplication.Models
{
    public class UtilizadorModel
    {
        public string username { get; set; }

        public string password { get; set; }

        public string UserTipo { get; set; }

        public UtilizadorModel(string username, string password, string UserTipo)
        {
            this.username = username;
            this.password = password;
            this.UserTipo = UserTipo;
        }
        public UtilizadorModel(string username, string UserTipo)
        {
            this.username = username;
            this.password = "";
            this.UserTipo = UserTipo;
        }
        public UtilizadorModel()
        {
            this.username = "";
            this.password = "";
            this.UserTipo = "";
        }
    }
}
