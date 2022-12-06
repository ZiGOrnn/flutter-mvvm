import 'package:my_app/features/social_media/data/repositories/posts_repository.dart';
import 'package:my_app/features/social_media/domain/models/comment_model.dart';
import 'package:my_app/features/social_media/domain/models/post_model.dart';

abstract class PostUseCases {
  Future<List<CommentModel>> getComments(int postId);
  Future<PostModel> getPost(int id);
  Future<List<PostModel>> getPosts();
}

class PostUseCasesImpl implements PostUseCases {
  final PostsRepository postsRepository;

  const PostUseCasesImpl({this.postsRepository = const PostsRepositoryImpl()});

  @override
  Future<List<CommentModel>> getComments(int postId) async {
    final result = await postsRepository.getComments(postId);
    List<CommentModel> comments = [];
    if (result.isNotEmpty) {
      comments = result
          .map((e) => CommentModel(
                id: e.id ?? 0,
                postId: e.postId ?? 0,
                name: e.name ?? "",
                email: e.email ?? "",
                body: e.body ?? "",
              ))
          .toList();
      return comments;
    }
    return comments;
  }

  @override
  Future<PostModel> getPost(int id) async {
    PostModel post = PostModel();
    final result = await postsRepository.getPost(id);
    post = PostModel(
      id: result.id ?? 0,
      userId: result.userId ?? 0,
      title: result.title ?? "",
      body: result.body ?? "",
    );
    return post;
  }

  @override
  Future<List<PostModel>> getPosts() async {
    List<PostModel> posts = [];
    final result = await postsRepository.getPosts();
    if (result.isNotEmpty) {
      posts = result
          .map((e) => PostModel(
                id: e.id ?? 0,
                userId: e.userId ?? 0,
                title: e.title ?? "",
                body: e.body ?? "",
              ))
          .toList();
      return posts;
    }
    return posts;
  }
}
