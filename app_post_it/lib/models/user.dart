class User {
  int id;
  String username;
  String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  // Método para converter o objeto User em um mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  // Construtor nomeado para criar um objeto User a partir de um mapa
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
