part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserSuccess extends UserState {
  final List<UserModel> users;

  UserSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class UserEmpty extends UserState {
  final List<UserModel> users = [];

  @override
  List<Object> get props => [users];
}

class UserFailure extends UserState {
  final String message;

  UserFailure(this.message);

  @override
  List<Object> get props => [message];
}
