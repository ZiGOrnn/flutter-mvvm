import 'package:my_app/features/auth/domain/models/user_model.dart';
import 'package:my_app/features/auth/domain/usecases/user_usecases.dart';

class UserUsecasesSpy implements UserUseCases {
  bool invokedGetUsers = false;
  int invokedGetUsersCount = 0;
  List<UserModel> stubbedGetUsersResult = [];

  @override
  Future<List<UserModel>> getUsers() async {
    invokedGetUsers = true;
    invokedGetUsersCount += 1;
    return stubbedGetUsersResult;
  }

  bool invokedGetUser = false;
  int invokedGetUserCount = 0;
  late Map invokedGetUserParameter;
  late UserModel stubbedGetUserResult;

  @override
  Future<UserModel> getUser(String id) async {
    invokedGetUser = true;
    invokedGetUserCount += 1;
    invokedGetUserParameter = {'id': id};
    return stubbedGetUserResult;
  }
}
