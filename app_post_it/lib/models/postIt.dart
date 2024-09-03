class PostIt {
  int id;
  String title;
  String text;
  int author;

  PostIt({
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

  factory PostIt.fromMap(Map<String, dynamic> map) {
    return PostIt(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      author: map['author'] ?? 0,
    );
  }
}
