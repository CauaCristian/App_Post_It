// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../postItController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostItController on _PostItController, Store {
  late final _$postsAtom =
      Atom(name: '_PostItController.posts', context: context);

  @override
  List<PostItModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostItModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$addPostItAsyncAction =
      AsyncAction('_PostItController.addPostIt', context: context);

  @override
  Future<void> addPostIt(
      String title, String description, String token, int authorId) {
    return _$addPostItAsyncAction
        .run(() => super.addPostIt(title, description, token, authorId));
  }

  late final _$getPostsAsyncAction =
      AsyncAction('_PostItController.getPosts', context: context);

  @override
  Future<void> getPosts(int authorId, String token) {
    return _$getPostsAsyncAction.run(() => super.getPosts(authorId, token));
  }

  late final _$updatePostItAsyncAction =
      AsyncAction('_PostItController.updatePostIt', context: context);

  @override
  Future<void> updatePostIt(String token, String title, String description,
      int authorId, int postId) {
    return _$updatePostItAsyncAction.run(
        () => super.updatePostIt(token, title, description, authorId, postId));
  }

  late final _$deletePostItAsyncAction =
      AsyncAction('_PostItController.deletePostIt', context: context);

  @override
  Future<void> deletePostIt(String token, String title, String description,
      int authorId, int postId) {
    return _$deletePostItAsyncAction.run(
        () => super.deletePostIt(token, title, description, authorId, postId));
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
