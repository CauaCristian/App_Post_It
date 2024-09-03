import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/services/apiService.dart';
import 'package:mobx/mobx.dart';

part 'store/userController.g.dart';

class Controller = UserController with _$Controller;

abstract class UserController with Store {
  ApiService apiService = ApiService();

  @observable
  UserModel? user;

  @action
  Future<void> loginUser(String username, String password) async {
    try {
      user = await apiService.loginUser(username, password);
      print('Usuário logado com sucesso: ${user?.username}');
    } catch (e) {
      print('Erro ao fazer login: $e');
      rethrow;
    }
  }

  @action
  Future<void> registerUser(String username, String password) async {
    try {
      user = await apiService.registerUser(username, password);
      print('Usuário registrado com sucesso: ${user?.username}');
    } catch (e) {
      print('Erro ao registrar usuário: $e');
      rethrow;
    }
  }

  @action
  void logoutUser() {
    user = null;
    print('Usuário deslogado');
  }
}
