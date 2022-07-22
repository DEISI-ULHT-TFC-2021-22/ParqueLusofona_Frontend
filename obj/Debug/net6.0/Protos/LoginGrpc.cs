// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: Protos/login.proto
// </auto-generated>
#pragma warning disable 0414, 1591
#region Designer generated code

using grpc = global::Grpc.Core;

namespace Server {
  public static partial class Login
  {
    static readonly string __ServiceName = "login.Login";

    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static void __Helper_SerializeMessage(global::Google.Protobuf.IMessage message, grpc::SerializationContext context)
    {
      #if !GRPC_DISABLE_PROTOBUF_BUFFER_SERIALIZATION
      if (message is global::Google.Protobuf.IBufferMessage)
      {
        context.SetPayloadLength(message.CalculateSize());
        global::Google.Protobuf.MessageExtensions.WriteTo(message, context.GetBufferWriter());
        context.Complete();
        return;
      }
      #endif
      context.Complete(global::Google.Protobuf.MessageExtensions.ToByteArray(message));
    }

    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static class __Helper_MessageCache<T>
    {
      public static readonly bool IsBufferMessage = global::System.Reflection.IntrospectionExtensions.GetTypeInfo(typeof(global::Google.Protobuf.IBufferMessage)).IsAssignableFrom(typeof(T));
    }

    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static T __Helper_DeserializeMessage<T>(grpc::DeserializationContext context, global::Google.Protobuf.MessageParser<T> parser) where T : global::Google.Protobuf.IMessage<T>
    {
      #if !GRPC_DISABLE_PROTOBUF_BUFFER_SERIALIZATION
      if (__Helper_MessageCache<T>.IsBufferMessage)
      {
        return parser.ParseFrom(context.PayloadAsReadOnlySequence());
      }
      #endif
      return parser.ParseFrom(context.PayloadAsNewBuffer());
    }

    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static readonly grpc::Marshaller<global::Server.LoginData> __Marshaller_login_LoginData = grpc::Marshallers.Create(__Helper_SerializeMessage, context => __Helper_DeserializeMessage(context, global::Server.LoginData.Parser));
    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static readonly grpc::Marshaller<global::Server.LoginAutorization> __Marshaller_login_LoginAutorization = grpc::Marshallers.Create(__Helper_SerializeMessage, context => __Helper_DeserializeMessage(context, global::Server.LoginAutorization.Parser));
    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static readonly grpc::Marshaller<global::Server.NewLoginData> __Marshaller_login_NewLoginData = grpc::Marshallers.Create(__Helper_SerializeMessage, context => __Helper_DeserializeMessage(context, global::Server.NewLoginData.Parser));
    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static readonly grpc::Marshaller<global::Server.PasswordChanged> __Marshaller_login_PasswordChanged = grpc::Marshallers.Create(__Helper_SerializeMessage, context => __Helper_DeserializeMessage(context, global::Server.PasswordChanged.Parser));

    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static readonly grpc::Method<global::Server.LoginData, global::Server.LoginAutorization> __Method_LoginRequest = new grpc::Method<global::Server.LoginData, global::Server.LoginAutorization>(
        grpc::MethodType.Unary,
        __ServiceName,
        "LoginRequest",
        __Marshaller_login_LoginData,
        __Marshaller_login_LoginAutorization);

    [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
    static readonly grpc::Method<global::Server.NewLoginData, global::Server.PasswordChanged> __Method_ChangePassword = new grpc::Method<global::Server.NewLoginData, global::Server.PasswordChanged>(
        grpc::MethodType.Unary,
        __ServiceName,
        "ChangePassword",
        __Marshaller_login_NewLoginData,
        __Marshaller_login_PasswordChanged);

    /// <summary>Service descriptor</summary>
    public static global::Google.Protobuf.Reflection.ServiceDescriptor Descriptor
    {
      get { return global::Server.LoginReflection.Descriptor.Services[0]; }
    }

    /// <summary>Client for Login</summary>
    public partial class LoginClient : grpc::ClientBase<LoginClient>
    {
      /// <summary>Creates a new client for Login</summary>
      /// <param name="channel">The channel to use to make remote calls.</param>
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public LoginClient(grpc::ChannelBase channel) : base(channel)
      {
      }
      /// <summary>Creates a new client for Login that uses a custom <c>CallInvoker</c>.</summary>
      /// <param name="callInvoker">The callInvoker to use to make remote calls.</param>
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public LoginClient(grpc::CallInvoker callInvoker) : base(callInvoker)
      {
      }
      /// <summary>Protected parameterless constructor to allow creation of test doubles.</summary>
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      protected LoginClient() : base()
      {
      }
      /// <summary>Protected constructor to allow creation of configured clients.</summary>
      /// <param name="configuration">The client configuration.</param>
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      protected LoginClient(ClientBaseConfiguration configuration) : base(configuration)
      {
      }

      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual global::Server.LoginAutorization LoginRequest(global::Server.LoginData request, grpc::Metadata headers = null, global::System.DateTime? deadline = null, global::System.Threading.CancellationToken cancellationToken = default(global::System.Threading.CancellationToken))
      {
        return LoginRequest(request, new grpc::CallOptions(headers, deadline, cancellationToken));
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual global::Server.LoginAutorization LoginRequest(global::Server.LoginData request, grpc::CallOptions options)
      {
        return CallInvoker.BlockingUnaryCall(__Method_LoginRequest, null, options, request);
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual grpc::AsyncUnaryCall<global::Server.LoginAutorization> LoginRequestAsync(global::Server.LoginData request, grpc::Metadata headers = null, global::System.DateTime? deadline = null, global::System.Threading.CancellationToken cancellationToken = default(global::System.Threading.CancellationToken))
      {
        return LoginRequestAsync(request, new grpc::CallOptions(headers, deadline, cancellationToken));
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual grpc::AsyncUnaryCall<global::Server.LoginAutorization> LoginRequestAsync(global::Server.LoginData request, grpc::CallOptions options)
      {
        return CallInvoker.AsyncUnaryCall(__Method_LoginRequest, null, options, request);
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual global::Server.PasswordChanged ChangePassword(global::Server.NewLoginData request, grpc::Metadata headers = null, global::System.DateTime? deadline = null, global::System.Threading.CancellationToken cancellationToken = default(global::System.Threading.CancellationToken))
      {
        return ChangePassword(request, new grpc::CallOptions(headers, deadline, cancellationToken));
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual global::Server.PasswordChanged ChangePassword(global::Server.NewLoginData request, grpc::CallOptions options)
      {
        return CallInvoker.BlockingUnaryCall(__Method_ChangePassword, null, options, request);
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual grpc::AsyncUnaryCall<global::Server.PasswordChanged> ChangePasswordAsync(global::Server.NewLoginData request, grpc::Metadata headers = null, global::System.DateTime? deadline = null, global::System.Threading.CancellationToken cancellationToken = default(global::System.Threading.CancellationToken))
      {
        return ChangePasswordAsync(request, new grpc::CallOptions(headers, deadline, cancellationToken));
      }
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      public virtual grpc::AsyncUnaryCall<global::Server.PasswordChanged> ChangePasswordAsync(global::Server.NewLoginData request, grpc::CallOptions options)
      {
        return CallInvoker.AsyncUnaryCall(__Method_ChangePassword, null, options, request);
      }
      /// <summary>Creates a new instance of client from given <c>ClientBaseConfiguration</c>.</summary>
      [global::System.CodeDom.Compiler.GeneratedCode("grpc_csharp_plugin", null)]
      protected override LoginClient NewInstance(ClientBaseConfiguration configuration)
      {
        return new LoginClient(configuration);
      }
    }

  }
}
#endregion
