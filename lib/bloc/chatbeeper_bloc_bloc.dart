import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatbeeper_bloc_event.dart';
part 'chatbeeper_bloc_state.dart';

class ChatbeeperBlocBloc extends Bloc<ChatbeeperBlocEvent, ChatbeeperBlocState> {
  ChatbeeperBlocBloc() : super(ChatbeeperBlocInitial()) {
    on<ChatbeeperBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
