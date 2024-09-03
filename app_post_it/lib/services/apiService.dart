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
}
