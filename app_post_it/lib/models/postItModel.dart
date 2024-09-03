import 'dart:convert';

class PostItModel {
  int id;
  String title;
  String description;
  int author;

  PostItModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
    };
  }

  factory PostItModel.fromMap(Map<String, dynamic> map) {
    return PostItModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      author: map['author'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostItModel.fromJson(String source) =>
      PostItModel.fromMap(json.decode(source));
}
