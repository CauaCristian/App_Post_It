import 'package:app_post_it/models/userModel.dart';
import 'package:app_post_it/services/apiService.dart';
import 'package:mobx/mobx.dart';
part 'userController.g.dart';

class Controller = UserController with _$Controller;

abstract class UserController with Store {
  ApiService apiService = ApiService();
  @observable
  UserModel? user;

  @action
  void LoginUser(String username, String password) async {
    user = await apiService.loginUser(username, password);
  }
}
