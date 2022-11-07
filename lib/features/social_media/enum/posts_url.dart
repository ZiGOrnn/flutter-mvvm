class PostsUrl {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static String getPost(id) {
    return '$baseUrl/posts/$id';
  }

  static String get getPosts {
    return '$baseUrl/posts';
  }

  static String getComments(postId) {
    return '$baseUrl/posts/$postId/comments';
  }
}
