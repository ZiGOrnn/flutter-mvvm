import 'dart:convert';

class PostBody {
  PostBody({
    required this.userId,
    required this.title,
    this.body,
  });

  int userId;
  String title;
  String? body;

  String toJson() => jsonEncode(<String, dynamic>{
        "userId": userId,
        "title": title,
        "body": body,
      });
}
