import 'package:app_post_it/services/tokenService.dart';
import 'package:mobx/mobx.dart';

part 'store/tokenController.g.dart';

class TokenController = _TokenControllerBase with _$TokenController;

abstract class _TokenControllerBase with Store {
  final TokenService _tokenService = TokenService();

  @observable
  String? token;

  @action
  Future<void> loadToken() async {
    try {
      token = await _tokenService.getToken();
      print('Token carregado: $token');
    } catch (e) {
      print('Erro ao carregar o token: $e');
    }
  }

  @action
  Future<void> saveToken(String newToken) async {
    try {
      await _tokenService.saveToken(newToken);
      token = newToken;
      print('Token salvo: $token');
    } catch (e) {
      print('Erro ao salvar o token: $e');
    }
  }

  @action
  Future<void> removeToken() async {
    try {
      await _tokenService.removeToken();
      token = null;
      print('Token removido');
    } catch (e) {
      print('Erro ao remover o token: $e');
    }
  }

  @computed
  bool get isTokenAvailable => token != null;
}
