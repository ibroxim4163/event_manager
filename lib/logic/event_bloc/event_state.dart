part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  final EventTodo eventTodo;
  const EventState(this.eventTodo);

  @override
  List<Object> get props => [eventTodo];
}

class LoadingState extends EventState {
  const LoadingState(super.eventTodo);
}

class LoadedState extends EventState {
  const LoadedState(super.eventTodo);
}

class ErrorState extends EventState {
  final String message;

  const ErrorState(
    super.eventTodo, {
    required this.message,
  });
}
