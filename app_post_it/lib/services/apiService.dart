import 'package:app_post_it/models/postItModel.dart';
import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/repositories/apiRepository.dart';

class ApiService {
  final Apirepository _apiRepository = Apirepository();

  Future<UserModel> registerUser(String username, String password) async {
    final user = await _apiRepository.register(username, password);
    return user;
  }

  Future<UserModel> loginUser(String username, String password) async {
    final user = await _apiRepository.login(username, password);
    return user;
  }

  Future<List<PostItModel>> getPostsByAuthor(int authorId, String token) async {
    final posts = await _apiRepository.findByAuthorld(authorId, token);
    return posts;
  }

  Future<PostItModel> createPostIt(
      String title, String description, String token, int authorId) async {
    final post =
        await _apiRepository.createPostIt(title, description, token, authorId);
    return post;
  }

  Future<PostItModel> updatePostIt(String token, String title,
      String description, int authorId, int id) async {
    final post = await _apiRepository.updatePostIt(
        token, title, description, authorId, id);
    return post;
  }

  Future<void> deletePostIt(String token, String title, String description,
      int authorId, int id) async {
    await _apiRepository.deletePostIt(token, title, description, authorId, id);
    print('Post-it deletado com sucesso');
  }
}
