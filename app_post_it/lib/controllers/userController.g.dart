// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on UserController, Store {
  late final _$userAtom = Atom(name: 'UserController.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$UserControllerActionController =
      ActionController(name: 'UserController', context: context);

  @override
  void setUser(int id, String username, String password) {
    final _$actionInfo = _$UserControllerActionController.startAction(
        name: 'UserController.setUser');
    try {
      return super.setUser(id, username, password);
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
