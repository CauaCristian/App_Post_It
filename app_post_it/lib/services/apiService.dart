import 'package:app_post_it/models/postItModel.dart';
import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/repositories/apiRepository.dart';

class ApiService {
  final Apirepository _apiRepository = Apirepository();

  Future<UserModel> registerUser(String username, String password) async {
    try {
      final user = await _apiRepository.register(username, password);
      return user;
    } catch (e) {
      print('Erro no registro: $e');
      rethrow;
    }
  }

  Future<UserModel> loginUser(String username, String password) async {
    try {
      final user = await _apiRepository.login(username, password);
      return user;
    } catch (e) {
      print('Erro no login: $e');
      rethrow;
    }
  }

  Future<List<PostItModel>> getPostsByAuthor(int authorId) async {
    try {
      final posts = await _apiRepository.findByAuthorld(authorId);
      return posts;
    } catch (e) {
      print('Erro ao buscar posts: $e');
      return [];
    }
  }

  Future<PostItModel> createPostIt(
      String title, String description, String token, int authorId) async {
    try {
      final post = await _apiRepository.createPostIt(
          title, description, token, authorId);
      return post;
    } catch (e) {
      print('Erro ao criar post-it: $e');
      rethrow;
    }
  }

  Future<PostItModel> updatePostIt(String token, String title,
      String description, int authorId, int id) async {
    try {
      final post = await _apiRepository.updatePostIt(
          token, title, description, authorId, id);
      return post;
    } catch (e) {
      print('Erro ao atualizar post-it: $e');
      rethrow;
    }
  }

  Future<void> deletePostIt(String token, String title, String description,
      int authorId, int id) async {
    try {
      await _apiRepository.deletePostIt(
          token, title, description, authorId, id);
      print('Post-it deletado com sucesso');
    } catch (e) {
      print('Erro ao deletar post-it: $e');
      rethrow;
    }
  }
}
