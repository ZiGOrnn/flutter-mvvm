import 'package:my_app/features/social_media/data/datasources/posts_api.dart';
import 'package:my_app/features/social_media/data/models/comments_response.dart';
import 'package:my_app/features/social_media/data/models/post_response.dart';
import 'package:my_app/features/social_media/enum/post_provider.dart';
import 'package:my_app/shared/models/api_status.dart';

abstract class PostsRepository {
  Future<List<CommentsResponse>> getComments(int postId);
  Future<PostResponse> getPost(int id);
  Future<List<PostResponse>> getPosts();
}

class PostsRepositoryImpl implements PostsRepository {
  const PostsRepositoryImpl();

  @override
  Future<List<CommentsResponse>> getComments(int postId) async {
    final postsApi = PostApiImpl(provider: PostProvider.getPost);
    postsApi.id = postId;
    final result = await postsApi.execute();
    if (result is Success<String>) {
      final response = commentsResponseFromJson(result.response);
      return response;
    }
    return [];
  }

  @override
  Future<PostResponse> getPost(int id) async {
    final postsApi = PostApiImpl(provider: PostProvider.getPost);
    postsApi.id = id;
    final result = await postsApi.execute();
    if (result is Success<String>) {
      final response = postResponseFromJson(result.response);
      return response;
    }
    return PostResponse();
  }

  @override
  Future<List<PostResponse>> getPosts() async {
    final postsApi = PostApiImpl(provider: PostProvider.getPosts);
    final result = await postsApi.execute();
    if (result is Success<String>) {
      final response = postsResponseFromJson(result.response);
      return response;
    }
    return [];
  }
}
