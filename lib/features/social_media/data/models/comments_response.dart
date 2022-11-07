// To parse this JSON data, do
//
//     final commentsResponse = commentsResponseFromJson(jsonString);

import 'dart:convert';

List<CommentsResponse> commentsResponseFromJson(String str) =>
    List<CommentsResponse>.from(
        json.decode(str).map((x) => CommentsResponse.fromJson(x)));

String commentsResponseToJson(List<CommentsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsResponse {
  CommentsResponse({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      CommentsResponse(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
