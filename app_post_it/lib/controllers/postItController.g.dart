// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postItController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on PostItController, Store {
  late final _$postsAtom =
      Atom(name: 'PostItController.posts', context: context);

  @override
  List<PostIt> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostIt> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$PostItControllerActionController =
      ActionController(name: 'PostItController', context: context);

  @override
  void addPostIt() {
    final _$actionInfo = _$PostItControllerActionController.startAction(
        name: 'PostItController.addPostIt');
    try {
      return super.addPostIt();
    } finally {
      _$PostItControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
