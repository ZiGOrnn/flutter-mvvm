import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/auth/data/models/user_list_response.dart';
import 'package:my_app/features/auth/domain/usecases/user_usecases.dart';

import '../spy/repositories/user_repository_spy.dart';

Future<void> main() async {
  late UserUseCasesImpl sut;
  late UserRepositorySpy userRepositorySpy;
  late List<UserListResponse> result;

  setUp(() {
    userRepositorySpy = UserRepositorySpy();
  });

  test('GetUsers when GetUsers Should Return Users', () async {
    // Arrange
    result = [
      UserListResponse(
        id: 1,
        name: 'flutter',
      )
    ];
    userRepositorySpy.stubbedGetUsersResult = result;
    sut = UserUseCasesImpl(userRepository: userRepositorySpy);

    // Act
    final users = await sut.getUsers();

    // Assert
    expect(userRepositorySpy.invokedGetUsers, true);
    expect(userRepositorySpy.invokedGetUsersCount, 1);
    expect(users[0].name, 'flutter');
  });

  test('GetUsers Empty when GetUsers Should Return Users Empty', () async {
    // Arrange
    result = [];
    userRepositorySpy.stubbedGetUsersResult = result;
    sut = UserUseCasesImpl(userRepository: userRepositorySpy);

    // Act
    final users = await sut.getUsers();

    // Assert
    expect(userRepositorySpy.invokedGetUsers, true);
    expect(userRepositorySpy.invokedGetUsersCount, 1);
    expect(users.length, 0);
  });

  test('GetUser when GetUser Should Return User', () async {
    // Arrange
    final resultUser = UserListResponse(name: 'GetUser');
    userRepositorySpy.stubbedGetUserResult = resultUser;
    sut = UserUseCasesImpl(userRepository: userRepositorySpy);

    // Act
    final users = await sut.getUser('1234');

    // Assert
    expect(userRepositorySpy.invokedGetUser, true);
    expect(userRepositorySpy.invokedGetUserCount, 1);
    expect(userRepositorySpy.invokedGetUserParameter['id'], '1234');
    expect(users.name, 'GetUser');
  });
}
