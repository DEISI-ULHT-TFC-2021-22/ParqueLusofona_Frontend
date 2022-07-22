namespace TFCApplication.Models
{
    public class UsersModel
    {
        public string numero { get; set; }

        public string nome { get; set; }

        public UsersModel(string numero, string nome)
        {
            this.numero = numero;
            this.nome = nome;
        }

    }
}
