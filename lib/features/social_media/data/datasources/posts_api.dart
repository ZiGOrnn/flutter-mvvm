import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_app/features/social_media/enum/post_provider.dart';
import 'package:my_app/shared/abstract/target_type.dart';
import 'package:my_app/shared/constant/api_status_code.dart';
import 'package:my_app/shared/constant/api_status_message.dart';
import 'package:my_app/shared/models/api_status.dart';

abstract class PostApi {
  Future<dynamic> execute();
}

class PostApiImpl implements PostApi, TargetType {
  PostProvider provider;
  String? id;

  PostApiImpl({required this.provider, this.id = ""});

  @override
  String baseURL() {
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
  String path() {
    String pathReq;
    switch (provider) {
      case PostProvider.getComments:
        pathReq = "/posts/$id/comments";
        break;
      case PostProvider.getPosts:
        pathReq = "/posts";
        break;
      case PostProvider.getPost:
      case PostProvider.createPost:
      case PostProvider.editPost:
      case PostProvider.deletePost:
        pathReq = "/posts/$id";
        break;
    }
    return pathReq;
  }

  @override
  Future<Response> request(Uri uri) async {
    Response response;
    switch (provider) {
      case PostProvider.getComments:
      case PostProvider.getPost:
      case PostProvider.getPosts:
        response = await http.get(uri);
        break;
      case PostProvider.createPost:
        response = await http.post(uri);
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
      final url = baseURL();
      final uri = Uri.parse(url);
      var response = await request(uri);
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
