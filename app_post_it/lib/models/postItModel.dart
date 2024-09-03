import 'dart:convert';

class PostItModel {
  int id;
  String title;
  String text;
  int author;

  PostItModel({
    required this.id,
    required this.title,
    required this.text,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'author': author,
    };
  }

  factory PostItModel.fromMap(Map<String, dynamic> map) {
    return PostItModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      author: map['author'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostItModel.fromJson(String source) =>
      PostItModel.fromMap(json.decode(source));
}
