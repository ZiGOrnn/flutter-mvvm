part of 'social_media_bloc.dart';

abstract class SocialMediaEvent extends Equatable {}

class SocialMediaLoadingEvent extends SocialMediaEvent {
  @override
  List<Object> get props => [];
}
