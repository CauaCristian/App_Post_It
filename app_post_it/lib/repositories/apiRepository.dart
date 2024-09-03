import 'dart:convert';
import 'package:http/http.dart' as http;

class Apirepository {
  final url = Uri.parse('https://api-post-it.onrender.com');

  void createUser() async {
    final headers = {"Content-Type": "application/json"};
    final body =
        json.encode({'username': 'novo_usuario', 'password': 'senha123'});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print('Usuário criado: ${data['username']}');
      } else {
        print('Erro ao criar usuário. Código: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de requisição: $e');
    }
  }
}
