///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'login.pb.dart' as $0;
export 'login.pb.dart';

class LoginClient extends $grpc.Client {
  static final _$loginRequest =
      $grpc.ClientMethod<$0.LoginData, $0.LoginAutorization>(
          '/login.Login/LoginRequest',
          ($0.LoginData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LoginAutorization.fromBuffer(value));
  static final _$changePassword =
      $grpc.ClientMethod<$0.NewLoginData, $0.PasswordChanged>(
          '/login.Login/ChangePassword',
          ($0.NewLoginData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PasswordChanged.fromBuffer(value));

  LoginClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginAutorization> loginRequest($0.LoginData request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.PasswordChanged> changePassword(
      $0.NewLoginData request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }
}

abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'login.Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginData, $0.LoginAutorization>(
        'LoginRequest',
        loginRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginData.fromBuffer(value),
        ($0.LoginAutorization value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewLoginData, $0.PasswordChanged>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewLoginData.fromBuffer(value),
        ($0.PasswordChanged value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginAutorization> loginRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginData> request) async {
    return loginRequest(call, await request);
  }

  $async.Future<$0.PasswordChanged> changePassword_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NewLoginData> request) async {
    return changePassword(call, await request);
  }

  $async.Future<$0.LoginAutorization> loginRequest(
      $grpc.ServiceCall call, $0.LoginData request);
  $async.Future<$0.PasswordChanged> changePassword(
      $grpc.ServiceCall call, $0.NewLoginData request);
}
