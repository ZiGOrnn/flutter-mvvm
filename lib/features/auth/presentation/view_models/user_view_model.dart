import 'package:flutter/material.dart';
import 'package:my_app/features/auth/domain/usecases/user_usecases.dart';
import 'package:my_app/features/auth/domain/models/user_error.dart';
import 'package:my_app/features/auth/domain/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  final UserUseCases userUseCases;

  bool _isLoading = false;
  List<UserModel> _userList = [];
  late UserError _userError;

  bool get loading => _isLoading;
  List<UserModel> get userList => _userList;
  UserError get userError => _userError;

  UserViewModel(this.userUseCases) {
    getUsers();
  }

  set setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  set setUserList(List<UserModel> userList) {
    _userList = userList;
  }

  set setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setIsLoading = true;
    var response = await userUseCases.getUsers();
    setUserList = response;
    setIsLoading = false;
  }
}
