///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginDataDescriptor instead')
const LoginData$json = const {
  '1': 'LoginData',
  '2': const [
    const {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginDataDescriptor = $convert.base64Decode('CglMb2dpbkRhdGESFAoFbG9naW4YASABKAlSBWxvZ2luEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginAutorizationDescriptor instead')
const LoginAutorization$json = const {
  '1': 'LoginAutorization',
  '2': const [
    const {'1': 'loginEfetuado', '3': 1, '4': 1, '5': 8, '10': 'loginEfetuado'},
    const {'1': 'tipo_user', '3': 2, '4': 1, '5': 9, '10': 'tipoUser'},
  ],
};

/// Descriptor for `LoginAutorization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginAutorizationDescriptor = $convert.base64Decode('ChFMb2dpbkF1dG9yaXphdGlvbhIkCg1sb2dpbkVmZXR1YWRvGAEgASgIUg1sb2dpbkVmZXR1YWRvEhsKCXRpcG9fdXNlchgCIAEoCVIIdGlwb1VzZXI=');
@$core.Deprecated('Use newLoginDataDescriptor instead')
const NewLoginData$json = const {
  '1': 'NewLoginData',
  '2': const [
    const {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    const {'1': 'oldPass', '3': 2, '4': 1, '5': 9, '10': 'oldPass'},
    const {'1': 'newPass', '3': 3, '4': 1, '5': 9, '10': 'newPass'},
  ],
};

/// Descriptor for `NewLoginData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newLoginDataDescriptor = $convert.base64Decode('CgxOZXdMb2dpbkRhdGESFAoFbG9naW4YASABKAlSBWxvZ2luEhgKB29sZFBhc3MYAiABKAlSB29sZFBhc3MSGAoHbmV3UGFzcxgDIAEoCVIHbmV3UGFzcw==');
@$core.Deprecated('Use passwordChangedDescriptor instead')
const PasswordChanged$json = const {
  '1': 'PasswordChanged',
  '2': const [
    const {'1': 'passAlterada', '3': 1, '4': 1, '5': 8, '10': 'passAlterada'},
  ],
};

/// Descriptor for `PasswordChanged`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordChangedDescriptor = $convert.base64Decode('Cg9QYXNzd29yZENoYW5nZWQSIgoMcGFzc0FsdGVyYWRhGAEgASgIUgxwYXNzQWx0ZXJhZGE=');
