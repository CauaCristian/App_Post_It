import 'package:app_post_it/repositories/tokenRepository.dart';

class TokenService {
  final TokenRepository _tokenRepository = TokenRepository();

  Future<void> saveToken(String token) async {
    await _tokenRepository.saveToken(token);
  }

  Future<String?> getToken() async {
    return await _tokenRepository.getToken();
  }

  Future<void> removeToken() async {
    await _tokenRepository.removeToken();
  }
}
