// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on UserController, Store {
  late final _$userAtom = Atom(name: 'UserController.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loginUserAsyncAction =
      AsyncAction('UserController.loginUser', context: context);

  @override
  Future<void> loginUser(String username, String password) {
    return _$loginUserAsyncAction
        .run(() => super.loginUser(username, password));
  }

  late final _$registerUserAsyncAction =
      AsyncAction('UserController.registerUser', context: context);

  @override
  Future<void> registerUser(String username, String password) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(username, password));
  }

  late final _$UserControllerActionController =
      ActionController(name: 'UserController', context: context);

  @override
  void logoutUser() {
    final _$actionInfo = _$UserControllerActionController.startAction(
        name: 'UserController.logoutUser');
    try {
      return super.logoutUser();
    } finally {
      _$UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
