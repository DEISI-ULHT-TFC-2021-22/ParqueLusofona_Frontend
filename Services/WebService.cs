using Grpc.Core;
using Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFCApplication.Services
{
    public class WebService : Web.WebBase
    {
        public override Task<Disponibilidade> GetDisponibilidade(ExisteDisponibilidade pedido, ServerCallContext context)
        {
            Boolean podeEnviarDados = false;

            // TODO
           
            // verificar se pode receber dados e alterar a variavel podeEnviarDados consoante o caso
            if (pedido.DisponivelNovaEntrada)
            {
                 if(TFCApplication.Pages.IndexModel.matricula == null)
            {
                podeEnviarDados = true;
            }
            }
            else if (!pedido.DisponivelNovaEntrada)
            {
                if (TFCApplication.Pages.IndexModel.matriculaSaida == null)
                {
                    podeEnviarDados = true;
                }
            }

            return Task.FromResult(new Disponibilidade { Disponivel = podeEnviarDados });
        }

        public override Task<Nothing> SendCancelaRequest(Dados pedido, ServerCallContext context)
        {
            //if (true dados validos)
            if (pedido.CameraEntrada)
            {
                Pages.IndexModel.setMatricula(pedido.Matricula, pedido.FotoLocation, pedido.MsgValidacao, pedido.User, pedido.PodeEntrar);
                // Recebe Dados
                Console.WriteLine("É Camera de Entrada? " + pedido.CameraEntrada);
                Console.WriteLine("Matricula " + pedido.Matricula);
                Console.WriteLine("Localização da Foto " + pedido.FotoLocation);
                Console.WriteLine("Utilizador " + pedido.User);
                Console.WriteLine("Resultado do Pedido: " + pedido.MsgValidacao);
                Console.WriteLine("Pode entrar? " + pedido.PodeEntrar);
                Console.WriteLine();
            }
            else
            {
                Pages.IndexModel.setMatriculaSaida(pedido.Matricula, pedido.FotoLocation, pedido.MsgValidacao, pedido.User, pedido.PodeEntrar);
                // Recebe Dados
                Console.WriteLine("É Camera de Entrada? " + pedido.CameraEntrada);
                Console.WriteLine("Matricula " + pedido.Matricula);
                Console.WriteLine("Localização da Foto " + pedido.FotoLocation);
                Console.WriteLine("Utilizador " + pedido.User);
                Console.WriteLine("Resultado do Pedido: " + pedido.MsgValidacao);
                Console.WriteLine("Pode entrar? " + pedido.PodeEntrar);
                Console.WriteLine();
            }
            return Task.FromResult(new Nothing());
        }
    }
}
