namespace TFCApplication.Models
{
    public class MatriculaModel
    {
        public string matricula { get; set; }

        public string fotoCaminho { get; set; }

        public string validade { get; set; }

        public MatriculaModel()
        {
        }

        public MatriculaModel(string matricula)
        {
            this.matricula = matricula;
        }
    }
}
