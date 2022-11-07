import 'package:my_app/features/auth/data/datasources/user_api.dart';
import 'package:my_app/features/auth/data/models/user_list_response.dart';
import 'package:my_app/shared/models/api_status.dart';

abstract class UserRepository {
  Future<UserListResponse> getUser(String id);
  Future<List<UserListResponse>> getUsers();
}

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  const UserRepositoryImpl({this.userApi = const UserApiImpl()});

  @override
  Future<List<UserListResponse>> getUsers() async {
    final response = await userApi.getUsers();
    if (response is Success<List<UserListResponse>>) {
      return response.response;
    }
    return [];
  }

  @override
  Future<UserListResponse> getUser(String id) async {
    return UserListResponse();
  }
}
