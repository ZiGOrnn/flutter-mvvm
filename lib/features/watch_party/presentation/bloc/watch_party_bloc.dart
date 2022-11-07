import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'watch_party_event.dart';
part 'watch_party_state.dart';

class WatchPartyBloc extends Bloc<WatchPartyEvent, WatchPartyState> {
  WatchPartyBloc() : super(WatchPartyInitial()) {
    on<WatchPartyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
