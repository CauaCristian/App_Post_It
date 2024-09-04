import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/services/apiService.dart';
import 'package:mobx/mobx.dart';

part 'store/userController.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final ApiService _apiService = ApiService();

  @observable
  UserModel? user;

  @action
  Future<void> loginUser(String username, String password) async {
    user = await _apiService.loginUser(username, password);
    print('Usuário logado com sucesso: ${user?.username}');
  }

  @action
  Future<void> registerUser(String username, String password) async {
    user = await _apiService.registerUser(username, password);
    print('Usuário registrado com sucesso: ${user?.username}');
  }

  @action
  void logoutUser() {
    user = null;
    print('Usuário deslogado');
  }
}
