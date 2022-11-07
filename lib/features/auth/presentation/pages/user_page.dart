import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/auth/domain/models/user_model.dart';
import 'package:my_app/features/auth/presentation/bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            UserBloc userBloc = UserBloc();
            userBloc.add(GetUsersEvent());
            return userBloc;
          },
        ),
      ],
      child: userBuilder(),
    );
  }

  BlocBuilder<UserBloc, UserState> userBuilder() {
    return BlocBuilder<UserBloc, UserState>(
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
                  BlocProvider.of<UserBloc>(context).add(UserLoadingEvent());
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

  Widget _ui(UserState state) {
    if (state is UserLoading) {
      return Container();
    } else if (state is UserSuccess) {
      return _userListView(state.users);
    } else {
      return Container();
    }
  }

  ListView _userListView(List<UserModel> users) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        UserModel user = users[index];
        return SizedBox(
          height: 50,
          child: Center(
            child: Text(
              user.name,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
