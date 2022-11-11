import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/features/social_media/domain/models/post_model.dart';
import 'package:my_app/features/social_media/domain/usecases/post_usecases.dart';

part 'social_media_event.dart';
part 'social_media_state.dart';

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  final PostUseCases postUseCases;

  SocialMediaBloc({this.postUseCases = const PostUseCasesImpl()})
      : super(SocialMediaInitial()) {
    on<SocialMediaLoadingEvent>((event, emit) async {
      final posts = await postUseCases.getPosts();
      if (kDebugMode) {
        print(posts.length);
      }
      emit(SocialMediaSuccess(posts));
    });
  }
}
