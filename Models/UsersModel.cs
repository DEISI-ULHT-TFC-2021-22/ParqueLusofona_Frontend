namespace TFCApplication.Models
{
    public class UsersModel
    {
        public string numero { get; set; }

        public string nome { get; set; }

        public string telefone { get; set; }

        public string uso { get; set; }

        public UsersModel(string numero, string nome, string telefone, string uso)
        {
            this.numero = numero;
            this.nome = nome;
            this.telefone = telefone;
            this.uso = uso;
        }

    }
}
