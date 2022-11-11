part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserModel> users;

  UserSuccess(this.users);
}

class UserEmpty extends UserState {
  final List<UserModel> users = [];
}

class UserFailure extends UserState {
  final String message;

  UserFailure(this.message);
}
