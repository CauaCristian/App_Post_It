import 'package:app_post_it/models/postItModel.dart';
import 'package:app_post_it/services/apiService.dart';
import 'package:mobx/mobx.dart';

part 'store/postItController.g.dart';

class PostItController = _PostItController with _$PostItController;

abstract class _PostItController with Store {
  final ApiService _apiService = ApiService();

  @observable
  List<PostItModel> posts = [];

  @action
  Future<void> addPostIt(
      String title, String description, String token, int authorId) async {
    final newPostIt =
        await _apiService.createPostIt(title, description, token, authorId);
    posts = await _apiService.getPostsByAuthor(authorId, token);
  }

  @action
  Future<void> getPosts(int authorId, String token) async {
    posts = await _apiService.getPostsByAuthor(authorId, token);
  }

  @action
  Future<void> updatePostIt(String token, String title, String description,
      int authorId, int postId) async {
    await _apiService.updatePostIt(token, title, description, authorId, postId);
    posts = await _apiService.getPostsByAuthor(authorId, token);
  }

  @action
  Future<void> deletePostIt(String token, String title, String description,
      int authorId, int postId) async {
    await _apiService.deletePostIt(token, title, description, authorId, postId);
    posts = await _apiService.getPostsByAuthor(authorId, token);
  }
}
