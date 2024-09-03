import 'package:app_post_it/models/user.dart';
import 'package:mobx/mobx.dart';
part 'userController.g.dart';

class Controller = UserController with _$Controller;

abstract class UserController with Store {
  @observable
  User? user;

  @action
  void setUser(int id, String username, String password) {
    user = User(id: id, username: username, password: password);
  }

  @action
  void updateUsername(String newUsername) {
    if (user != null) {
      user = User(
        id: user!.id,
        username: newUsername,
        password: user!.password,
      );
    }
  }

  @action
  void updatePassword(String newPassword) {
    if (user != null) {
      user = User(
        id: user!.id,
        username: user!.username,
        password: newPassword,
      );
    }
  }
}
