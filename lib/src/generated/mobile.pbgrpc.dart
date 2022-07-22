///
//  Generated code. Do not modify.
//  source: mobile.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'mobile.pb.dart' as $0;
export 'mobile.pb.dart';

class MobileClient extends $grpc.Client {
  static final _$abrirCancela = $grpc.ClientMethod<$0.Pedido, $0.Resposta>(
      '/mobile.Mobile/AbrirCancela',
      ($0.Pedido value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Resposta.fromBuffer(value));

  MobileClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Resposta> abrirCancela($0.Pedido request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$abrirCancela, request, options: options);
  }
}

abstract class MobileServiceBase extends $grpc.Service {
  $core.String get $name => 'mobile.Mobile';

  MobileServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Pedido, $0.Resposta>(
        'AbrirCancela',
        abrirCancela_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Pedido.fromBuffer(value),
        ($0.Resposta value) => value.writeToBuffer()));
  }

  $async.Future<$0.Resposta> abrirCancela_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Pedido> request) async {
    return abrirCancela(call, await request);
  }

  $async.Future<$0.Resposta> abrirCancela(
      $grpc.ServiceCall call, $0.Pedido request);
}
