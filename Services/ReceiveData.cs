using Server;
using Grpc.Core;


namespace TFCApplication.Services
{
    public class ReceiveData : DataService.DataServiceBase
    {

        public Task<HelloReply1> SayHello1(HelloRequest1 request, ServerCallContext context)
        {
            return Task.FromResult(new HelloReply1
            {
                Message = "Hello " + request.Name
            });
        }
    }
}