///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LoginData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'login')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginData._() : super();
  factory LoginData({
    $core.String? login,
    $core.String? password,
  }) {
    final _result = create();
    if (login != null) {
      _result.login = login;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginData clone() => LoginData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginData copyWith(void Function(LoginData) updates) => super.copyWith((message) => updates(message as LoginData)) as LoginData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginData create() => LoginData._();
  LoginData createEmptyInstance() => create();
  static $pb.PbList<LoginData> createRepeated() => $pb.PbList<LoginData>();
  @$core.pragma('dart2js:noInline')
  static LoginData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginData>(create);
  static LoginData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get login => $_getSZ(0);
  @$pb.TagNumber(1)
  set login($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLogin() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogin() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginAutorization extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginAutorization', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginEfetuado', protoName: 'loginEfetuado')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tipoUser')
    ..hasRequiredFields = false
  ;

  LoginAutorization._() : super();
  factory LoginAutorization({
    $core.bool? loginEfetuado,
    $core.String? tipoUser,
  }) {
    final _result = create();
    if (loginEfetuado != null) {
      _result.loginEfetuado = loginEfetuado;
    }
    if (tipoUser != null) {
      _result.tipoUser = tipoUser;
    }
    return _result;
  }
  factory LoginAutorization.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginAutorization.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginAutorization clone() => LoginAutorization()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginAutorization copyWith(void Function(LoginAutorization) updates) => super.copyWith((message) => updates(message as LoginAutorization)) as LoginAutorization; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginAutorization create() => LoginAutorization._();
  LoginAutorization createEmptyInstance() => create();
  static $pb.PbList<LoginAutorization> createRepeated() => $pb.PbList<LoginAutorization>();
  @$core.pragma('dart2js:noInline')
  static LoginAutorization getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginAutorization>(create);
  static LoginAutorization? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get loginEfetuado => $_getBF(0);
  @$pb.TagNumber(1)
  set loginEfetuado($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLoginEfetuado() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginEfetuado() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tipoUser => $_getSZ(1);
  @$pb.TagNumber(2)
  set tipoUser($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTipoUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearTipoUser() => clearField(2);
}

class NewLoginData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewLoginData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'login')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldPass', protoName: 'oldPass')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newPass', protoName: 'newPass')
    ..hasRequiredFields = false
  ;

  NewLoginData._() : super();
  factory NewLoginData({
    $core.String? login,
    $core.String? oldPass,
    $core.String? newPass,
  }) {
    final _result = create();
    if (login != null) {
      _result.login = login;
    }
    if (oldPass != null) {
      _result.oldPass = oldPass;
    }
    if (newPass != null) {
      _result.newPass = newPass;
    }
    return _result;
  }
  factory NewLoginData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewLoginData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewLoginData clone() => NewLoginData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewLoginData copyWith(void Function(NewLoginData) updates) => super.copyWith((message) => updates(message as NewLoginData)) as NewLoginData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewLoginData create() => NewLoginData._();
  NewLoginData createEmptyInstance() => create();
  static $pb.PbList<NewLoginData> createRepeated() => $pb.PbList<NewLoginData>();
  @$core.pragma('dart2js:noInline')
  static NewLoginData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewLoginData>(create);
  static NewLoginData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get login => $_getSZ(0);
  @$pb.TagNumber(1)
  set login($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLogin() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogin() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get oldPass => $_getSZ(1);
  @$pb.TagNumber(2)
  set oldPass($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOldPass() => $_has(1);
  @$pb.TagNumber(2)
  void clearOldPass() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPass => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPass($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewPass() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPass() => clearField(3);
}

class PasswordChanged extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PasswordChanged', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'login'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passAlterada', protoName: 'passAlterada')
    ..hasRequiredFields = false
  ;

  PasswordChanged._() : super();
  factory PasswordChanged({
    $core.bool? passAlterada,
  }) {
    final _result = create();
    if (passAlterada != null) {
      _result.passAlterada = passAlterada;
    }
    return _result;
  }
  factory PasswordChanged.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PasswordChanged.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PasswordChanged clone() => PasswordChanged()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PasswordChanged copyWith(void Function(PasswordChanged) updates) => super.copyWith((message) => updates(message as PasswordChanged)) as PasswordChanged; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PasswordChanged create() => PasswordChanged._();
  PasswordChanged createEmptyInstance() => create();
  static $pb.PbList<PasswordChanged> createRepeated() => $pb.PbList<PasswordChanged>();
  @$core.pragma('dart2js:noInline')
  static PasswordChanged getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PasswordChanged>(create);
  static PasswordChanged? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get passAlterada => $_getBF(0);
  @$pb.TagNumber(1)
  set passAlterada($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassAlterada() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassAlterada() => clearField(1);
}

