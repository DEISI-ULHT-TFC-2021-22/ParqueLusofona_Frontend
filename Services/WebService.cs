using Grpc.Core;
using Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFCApplication.Models;
using TFCApplication.Pages;

namespace TFCApplication.Services
{
    public class WebService : Matriculas.MatriculasBase
    {
        public override Task<Disponibilidade> GetDisponibilidade(ExisteDisponibilidade pedido, ServerCallContext context)
        {
            Boolean podeEnviarDados = true;
            // TODO
            // verificar se pode receber dados e alterar a variavel podeEnviarDados consoante o caso
            if (pedido.DisponivelNovaEntrada)
            {
                
                podeEnviarDados = IndexModel.matricula == null;
                Console.WriteLine("Pode Enviar: " + podeEnviarDados);
            }
            else
            {
                podeEnviarDados = IndexModel.matricula == null;
                Console.WriteLine("Pode Enviar: " + podeEnviarDados);
            }
            
            return Task.FromResult(new Disponibilidade { Disponivel = podeEnviarDados });
        }

        public override Task<DadosRecebidos> SetMatricula(Dados pedido, ServerCallContext context)
        {
            //if (true dados validos)
            if (pedido.CameraEntrada)
            {
                // Recebe Dados
                bool cameraEntrada = pedido.CameraEntrada;
                string matricula = pedido.Matricula;
                string fotoLocation = pedido.FotoLocation;
                string user = pedido.User;
                Console.WriteLine(cameraEntrada);
                Console.WriteLine(matricula);
                Console.WriteLine(fotoLocation);
                Console.WriteLine(user);
            }
            else
            {
                // Recebe Dados
                bool cameraEntrada = pedido.CameraEntrada;
                string matricula = pedido.Matricula;
                string fotoLocation = pedido.FotoLocation;
                string user = pedido.User;
                Console.WriteLine(cameraEntrada);
                Console.WriteLine(matricula);
                Console.WriteLine(fotoLocation);
                Console.WriteLine(user);
            }

            return Task.FromResult(new DadosRecebidos());
        }
    }
}
