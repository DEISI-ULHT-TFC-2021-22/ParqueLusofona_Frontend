///
//  Generated code. Do not modify.
//  source: mobile.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Pedido extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Pedido', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cancelaEntrada', protoName: 'cancelaEntrada')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'login')
    ..hasRequiredFields = false
  ;

  Pedido._() : super();
  factory Pedido({
    $core.bool? cancelaEntrada,
    $core.String? login,
  }) {
    final _result = create();
    if (cancelaEntrada != null) {
      _result.cancelaEntrada = cancelaEntrada;
    }
    if (login != null) {
      _result.login = login;
    }
    return _result;
  }
  factory Pedido.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Pedido.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Pedido clone() => Pedido()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Pedido copyWith(void Function(Pedido) updates) => super.copyWith((message) => updates(message as Pedido)) as Pedido; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Pedido create() => Pedido._();
  Pedido createEmptyInstance() => create();
  static $pb.PbList<Pedido> createRepeated() => $pb.PbList<Pedido>();
  @$core.pragma('dart2js:noInline')
  static Pedido getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pedido>(create);
  static Pedido? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get cancelaEntrada => $_getBF(0);
  @$pb.TagNumber(1)
  set cancelaEntrada($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCancelaEntrada() => $_has(0);
  @$pb.TagNumber(1)
  void clearCancelaEntrada() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get login => $_getSZ(1);
  @$pb.TagNumber(2)
  set login($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogin() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogin() => clearField(2);
}

class Resposta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Resposta', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mensagem')
    ..hasRequiredFields = false
  ;

  Resposta._() : super();
  factory Resposta({
    $core.String? mensagem,
  }) {
    final _result = create();
    if (mensagem != null) {
      _result.mensagem = mensagem;
    }
    return _result;
  }
  factory Resposta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Resposta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Resposta clone() => Resposta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Resposta copyWith(void Function(Resposta) updates) => super.copyWith((message) => updates(message as Resposta)) as Resposta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Resposta create() => Resposta._();
  Resposta createEmptyInstance() => create();
  static $pb.PbList<Resposta> createRepeated() => $pb.PbList<Resposta>();
  @$core.pragma('dart2js:noInline')
  static Resposta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Resposta>(create);
  static Resposta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mensagem => $_getSZ(0);
  @$pb.TagNumber(1)
  set mensagem($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMensagem() => $_has(0);
  @$pb.TagNumber(1)
  void clearMensagem() => clearField(1);
}

