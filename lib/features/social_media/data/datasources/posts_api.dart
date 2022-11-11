import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_app/features/social_media/enum/post_provider.dart';
import 'package:my_app/shared/abstract/target_type.dart';
import 'package:my_app/shared/constant/api_status_code.dart';
import 'package:my_app/shared/constant/api_status_message.dart';
import 'package:my_app/shared/models/api_status.dart';

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

abstract class PostApi {
  Future<dynamic> execute();
}

class PostApiImpl implements PostApi, TargetType {
  PostProvider provider;
  String? id;
  late String _postBody;

  PostApiImpl({required this.provider, this.id = ""});

  set setPostBody(PostBody body) {
    _postBody = body.toJson();
  }

  String get postBody => _postBody;

  @override
  String get baseURL {
    String url;
    switch (provider) {
      case PostProvider.getComments:
      case PostProvider.getPost:
      case PostProvider.getPosts:
      case PostProvider.createPost:
      case PostProvider.editPost:
      case PostProvider.deletePost:
        url = "https://jsonplaceholder.typicode.com";
        break;
    }
    return url;
  }

  @override
  String get path {
    String pathReq;
    switch (provider) {
      case PostProvider.getPost:
      case PostProvider.editPost:
      case PostProvider.deletePost:
        pathReq = "/posts/$id";
        break;
      case PostProvider.getPosts:
      case PostProvider.createPost:
        pathReq = "/posts";
        break;
      case PostProvider.getComments:
        pathReq = "/posts/$id/comments";
        break;
    }
    return pathReq;
  }

  @override
  String get url {
    return baseURL + path;
  }

  @override
  Future<Response> request() async {
    final uri = Uri.parse(url);
    Response response;
    switch (provider) {
      case PostProvider.getComments:
      case PostProvider.getPost:
      case PostProvider.getPosts:
        response = await http.get(uri);
        break;
      case PostProvider.createPost:
        response = await http.post(
          uri,
          body: postBody,
        );
        break;
      case PostProvider.editPost:
        response = await http.patch(uri);
        break;
      case PostProvider.deletePost:
        response = await http.delete(uri);
        break;
    }
    return response;
  }

  @override
  Future<dynamic> execute() async {
    try {
      var response = await request();
      if (response.statusCode == success) {
        return Success<String>(
          code: success,
          response: response.body,
        );
      }
      return Failure<String>(
        code: invalidResponse,
        errorResponse: invalidResponseMsg,
      );
    } on HttpException {
      return Failure<String>(
        code: noInternet,
        errorResponse: noInternetMsg,
      );
    } on FormatException {
      return Failure<String>(
        code: invalidFormat,
        errorResponse: invalidFormatMsg,
      );
    } catch (e) {
      return Failure<String>(
        code: unknownError,
        errorResponse: unknownErrorMsg,
      );
    }
  }
}
