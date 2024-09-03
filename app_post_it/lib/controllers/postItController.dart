import 'package:app_post_it/models/postIt.dart';
import 'package:mobx/mobx.dart';
part 'postItController.g.dart';

class Controller = PostItController with _$Controller;

abstract class PostItController with Store {
  @observable
  List<PostIt> posts = [];
  @action
  void addPostIt() {}
}
