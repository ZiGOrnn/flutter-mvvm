import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_app/features/social_media/data/models/comments_response.dart';
import 'package:my_app/features/social_media/data/models/post_response.dart';
import 'package:my_app/features/social_media/enum/posts_url.dart';
import 'package:my_app/features/social_media/data/models/posts_response.dart';
import 'package:my_app/shared/constant/api_status_code.dart';
import 'package:my_app/shared/constant/api_status_message.dart';
import 'package:my_app/shared/models/api_status.dart';

abstract class PostsApi {
  Future<dynamic> getComments(String postId);
  Future<dynamic> getPost(String id);
  Future<dynamic> getPosts();
}

class PostsApiImpl implements PostsApi {
  const PostsApiImpl();

  @override
  Future getComments(String postId) async {
    try {
      var url = Uri.parse(PostsUrl.getComments(postId));
      var response = await http.get(url);
      if (response.statusCode == success) {
        final commentsResponse = commentsResponseFromJson(response.body);
        return Success<List<CommentsResponse>>(
          code: success,
          response: commentsResponse,
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

  @override
  Future getPost(String id) async {
    try {
      var url = Uri.parse(PostsUrl.getPost(id));
      var response = await http.get(url);
      if (response.statusCode == success) {
        final postResponse = postResponseFromJson(response.body);
        return Success<PostResponse>(
          code: success,
          response: postResponse,
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

  @override
  Future getPosts() async {
    try {
      var url = Uri.parse(PostsUrl.getPosts);
      var response = await http.get(url);
      if (response.statusCode == success) {
        final postsResponse = postsResponseFromJson(response.body);
        return Success<List<PostsResponse>>(
          code: success,
          response: postsResponse,
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
