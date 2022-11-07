import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/features/auth/domain/models/user_model.dart';
import 'package:my_app/features/auth/domain/usecases/user_usecases.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCases userUseCases;

  UserBloc({this.userUseCases = const UserUseCasesImpl()})
      : super(UserInitial()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoading());
      final users = await userUseCases.getUsers();
      if (users.isNotEmpty) {
        emit(UserSuccess(users));
      } else {
        emit(UserEmpty());
      }
    });

    on<UserLoadingEvent>((event, emit) {
      emit(UserLoading());
    });
  }
}
