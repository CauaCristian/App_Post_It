import 'dart:convert';
import 'package:app_post_it/models/postItModel.dart';
import 'package:app_post_it/models/userModel.dart';
import 'package:http/http.dart' as http;

class Apirepository {
  final String baseUrl = 'https://api-post-it-1.onrender.com';

  Future<UserModel> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print('Post enviado com sucesso');
      print('Corpo da resposta: ${response.body}');

      final userJson = json.decode(response.body)['user'];
      final token = json.decode(response.body)['token'];
      final user = UserModel.fromJson(userJson);
      return user;
    } else {
      print('Erro ao enviar post. Código de status: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
      throw Exception('Falha ao registrar usuário');
    }
  }

  Future<UserModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print('Logado com sucesso');
      print('Corpo da resposta: ${response.body}');

      final userJson = json.decode(response.body)['user'];
      final user = UserModel.fromJson(userJson);
      final token = json.decode(response.body)['token'];

      return user;
    } else {
      print('Erro ao enviar post. Código de status: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
      throw Exception('Falha ao registrar usuário');
    }
  }

  Future<List<PostItModel>> findByAuthorld(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/postIt/findByAuthorId/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('Deu certo MLKAO');
      print('$response estou printando a response');
      final List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => PostItModel.fromJson(json)).toList();
    }
    return [];
  }
}
