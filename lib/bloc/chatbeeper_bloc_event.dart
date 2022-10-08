part of 'chatbeeper_bloc_bloc.dart';

@immutable
abstract class ChatbeeperBlocEvent {
  const ChatbeeperBlocEvent();
}

@immutable
class ChangeTextEvent extends ChatbeeperBlocEvent {
  const ChangeTextEvent();
}
