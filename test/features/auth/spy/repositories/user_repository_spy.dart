import 'package:my_app/features/auth/data/models/user_list_response.dart';
import 'package:my_app/features/auth/domain/repositories/user_repository.dart';

class UserRepositorySpy implements UserRepository {
  bool invokedGetUsers = false;
  int invokedGetUsersCount = 0;
  List<UserListResponse> stubbedGetUsersResult = [];

  @override
  Future<List<UserListResponse>> getUsers() async {
    invokedGetUsers = true;
    invokedGetUsersCount += 1;
    return stubbedGetUsersResult;
  }

  bool invokedGetUser = false;
  int invokedGetUserCount = 0;
  late Map invokedGetUserParameter;
  late UserListResponse stubbedGetUserResult;

  @override
  Future<UserListResponse> getUser(String id) async {
    invokedGetUser = true;
    invokedGetUserCount += 1;
    invokedGetUserParameter = {'id': id};
    return stubbedGetUserResult;
  }
}
