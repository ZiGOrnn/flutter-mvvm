import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_app/features/auth/constant/user_domain.dart';
import 'package:my_app/features/auth/data/models/user_list_response.dart';
import 'package:my_app/shared/constant/api_status_code.dart';
import 'package:my_app/shared/constant/api_status_message.dart';
import 'package:my_app/shared/models/api_status.dart';

abstract class UserApi {
  Future<dynamic> getUsers();
}

class UserApiImpl implements UserApi {
  const UserApiImpl();

  @override
  Future<dynamic> getUsers() async {
    try {
      var url = Uri.parse(usersList);
      var response = await http.get(url);
      if (response.statusCode == success) {
        final userListResponse = userListResponseFromJson(response.body);
        return Success<List<UserListResponse>>(
          code: success,
          response: userListResponse,
        );
      }
      return Failure<String>(
        code: invalidResponse,
        errorResponse: invalidResponseMsg,
      );
    } on HttpException {
      return Failure<String>(
        code: noInternet,
        errorResponse: noInternetMsg,
      );
    } on FormatException {
      return Failure<String>(
        code: invalidFormat,
        errorResponse: invalidFormatMsg,
      );
    } catch (e) {
      return Failure<String>(
        code: unknownError,
        errorResponse: unknownErrorMsg,
      );
    }
  }
}
