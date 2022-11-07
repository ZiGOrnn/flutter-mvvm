import 'package:my_app/features/social_media/data/datasources/posts_api.dart';
import 'package:my_app/features/social_media/data/models/comments_response.dart';
import 'package:my_app/features/social_media/data/models/post_response.dart';
import 'package:my_app/features/social_media/data/models/posts_response.dart';
import 'package:my_app/shared/models/api_status.dart';

abstract class PostsRepository {
  Future<List<CommentsResponse>> getComments(String postId);
  Future<PostResponse> getPost(String id);
  Future<List<PostsResponse>> getPosts();
}

class PostsRepositoryImpl implements PostsRepository {
  final PostsApi postsApi;

  const PostsRepositoryImpl({this.postsApi = const PostsApiImpl()});

  @override
  Future<List<CommentsResponse>> getComments(String postId) async {
    final response = await postsApi.getComments(postId);
    if (response is Success<List<CommentsResponse>>) {
      return response.response;
    }
    return [];
  }

  @override
  Future<PostResponse> getPost(String id) async {
    final response = await postsApi.getPost(id);
    if (response is Success<PostResponse>) {
      return response.response;
    }
    return PostResponse();
  }

  @override
  Future<List<PostsResponse>> getPosts() async {
    final response = await postsApi.getPosts();
    if (response is Success<List<PostsResponse>>) {
      return response.response;
    }
    return [];
  }
}
