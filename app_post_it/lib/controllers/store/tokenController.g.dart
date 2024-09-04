// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tokenController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenController on _TokenController, Store {
  Computed<bool>? _$isTokenAvailableComputed;

  @override
  bool get isTokenAvailable => (_$isTokenAvailableComputed ??= Computed<bool>(
          () => super.isTokenAvailable,
          name: '_TokenController.isTokenAvailable'))
      .value;

  late final _$tokenAtom =
      Atom(name: '_TokenController.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$loadTokenAsyncAction =
      AsyncAction('_TokenController.loadToken', context: context);

  @override
  Future<void> loadToken() {
    return _$loadTokenAsyncAction.run(() => super.loadToken());
  }

  late final _$saveTokenAsyncAction =
      AsyncAction('_TokenController.saveToken', context: context);

  @override
  Future<void> saveToken(String newToken) {
    return _$saveTokenAsyncAction.run(() => super.saveToken(newToken));
  }

  late final _$removeTokenAsyncAction =
      AsyncAction('_TokenController.removeToken', context: context);

  @override
  Future<void> removeToken() {
    return _$removeTokenAsyncAction.run(() => super.removeToken());
  }

  @override
  String toString() {
    return '''
token: ${token},
isTokenAvailable: ${isTokenAvailable}
    ''';
  }
}
