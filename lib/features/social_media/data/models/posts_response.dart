// To parse this JSON data, do
//
//     final postsResponse = postsResponseFromJson(jsonString);

import 'dart:convert';

List<PostsResponse> postsResponseFromJson(String str) =>
    List<PostsResponse>.from(
        json.decode(str).map((x) => PostsResponse.fromJson(x)));

String postsResponseToJson(List<PostsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsResponse {
  PostsResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
