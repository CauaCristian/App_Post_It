import 'package:app_post_it/models/postItModel.dart';
import 'package:app_post_it/services/apiService.dart';
import 'package:mobx/mobx.dart';

part 'postItController.g.dart';

class Controller = PostItController with _$Controller;

abstract class PostItController with Store {
  ApiService apiService = ApiService();

  @observable
  List<PostItModel> posts = [];

  @action
  Future<void> addPostIt(
      String title, String description, String token, int authorId) async {
    try {
      final newPostIt =
          await apiService.createPostIt(title, description, token, authorId);
      posts = List.from(posts)..add(newPostIt);
    } catch (e) {
      print('Erro ao adicionar post-it: $e');
      rethrow;
    }
  }

  @action
  Future<void> getPosts(int authorId) async {
    try {
      posts = await apiService.getPostsByAuthor(authorId);
    } catch (e) {
      print('Erro ao buscar posts: $e');
      rethrow;
    }
  }

  @action
  Future<void> updatePostIt(String token, String title, String description,
      int authorId, int postId) async {
    try {
      final updatedPostIt = await apiService.updatePostIt(
          token, title, description, authorId, postId);
      posts = posts
          .map((post) => post.id == postId ? updatedPostIt : post)
          .toList();
    } catch (e) {
      print('Erro ao atualizar post-it: $e');
      rethrow;
    }
  }

  @action
  Future<void> deletePostIt(String token, String title, String description,
      int authorId, int postId) async {
    try {
      await apiService.deletePostIt(
          token, title, description, authorId, postId);
      posts = posts.where((post) => post.id != postId).toList();
    } catch (e) {
      print('Erro ao deletar post-it: $e');
      rethrow;
    }
  }
}
