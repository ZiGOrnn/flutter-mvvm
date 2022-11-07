import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_app/features/auth/domain/models/user_model.dart';
import 'package:my_app/features/auth/presentation/bloc/user_bloc.dart';

import '../spy/usecases/user_usecases_spy.dart';

void main() {
  late UserBloc userBloc;
  late UserUsecasesSpy userUsecasesSpy;
  late List<UserModel> result;

  setUp(() {
    userUsecasesSpy = UserUsecasesSpy();
  });

  blocTest<UserBloc, UserState>(
    'emits [UserLoading, UserSuccess] when GetUsersEvent is added.',
    setUp: () {
      result = [UserModel(name: 'bloc unit test')];
      userUsecasesSpy.stubbedGetUsersResult = result;
      userBloc = UserBloc(userUseCases: userUsecasesSpy);
    },
    build: () => userBloc,
    act: (bloc) => bloc.add(GetUsersEvent()),
    expect: () {
      expect(userUsecasesSpy.invokedGetUsersCount, 1);
      expect(userUsecasesSpy.invokedGetUsers, true);
      return [UserLoading(), UserSuccess(result)];
    },
    verify: (bloc) {
      List<UserModel> result = bloc.state.props[0] as List<UserModel>;
      expect(result[0].name, 'bloc unit test');
    },
  );

  blocTest<UserBloc, UserState>(
    'emits [UserLoading, UserEmpty] when GetUsersEvent Users Empty is added.',
    setUp: () {
      result = [];
      userUsecasesSpy.stubbedGetUsersResult = result;
      userBloc = UserBloc(userUseCases: userUsecasesSpy);
    },
    build: () => userBloc,
    act: (bloc) => bloc.add(GetUsersEvent()),
    expect: () {
      expect(userUsecasesSpy.invokedGetUsersCount, 1);
      expect(userUsecasesSpy.invokedGetUsers, true);
      return [UserLoading(), UserEmpty()];
    },
    verify: (bloc) {
      List<UserModel> result = bloc.state.props[0] as List<UserModel>;
      expect(result.length, 0);
    },
  );

  blocTest<UserBloc, UserState>(
    'emits [UserLoading] when UserLoadingEvent is added.',
    setUp: () {
      result = [];
      userUsecasesSpy.stubbedGetUsersResult = result;
      userBloc = UserBloc(userUseCases: userUsecasesSpy);
    },
    build: () => userBloc,
    act: (bloc) => bloc.add(UserLoadingEvent()),
    expect: () {
      expect(userUsecasesSpy.invokedGetUsersCount, 0);
      expect(userUsecasesSpy.invokedGetUsers, false);
      return [UserLoading()];
    },
  );
}
