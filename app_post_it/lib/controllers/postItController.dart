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
  void addPostIt() {}
  @action
  Future getPosts(int authorId) async {
    posts = await apiService.getPostsByAuthor(authorId);
  }
}
