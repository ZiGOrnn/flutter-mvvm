part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {}

class GetUsersEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class UserLoadingEvent extends UserEvent {
  @override
  List<Object> get props => [];
}
