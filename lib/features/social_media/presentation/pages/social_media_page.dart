import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/social_media/domain/models/post_model.dart';
import 'package:my_app/features/social_media/presentation/bloc/social_media_bloc.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            SocialMediaBloc userBloc = SocialMediaBloc();
            return userBloc;
          },
        ),
      ],
      child: userBuilder(),
    );
  }

  userBuilder() {
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  BlocProvider.of<SocialMediaBloc>(context)
                      .add(SocialMediaLoadingEvent());
                },
                child: const Text('TextButton'),
              ),
              Expanded(
                child: _ui(state),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _ui(SocialMediaState state) {
    if (state is SocialMediaSuccess) {
      return _userListView(state.posts);
    } else {
      return Container();
    }
  }

  ListView _userListView(List<PostModel> posts) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        PostModel user = posts[index];
        return SizedBox(
          height: 50,
          child: Center(
            child: Text(
              user.title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
