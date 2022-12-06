part of 'social_media_bloc.dart';

abstract class SocialMediaState extends Equatable {
  const SocialMediaState();

  @override
  List<Object> get props => [];
}

class SocialMediaInitial extends SocialMediaState {}

class SocialMediaSuccess extends SocialMediaState {
  final List<PostModel> posts;
  const SocialMediaSuccess(this.posts);
}

class PostSuccess extends SocialMediaState {
  final PostModel post;
  const PostSuccess(this.post);
}
