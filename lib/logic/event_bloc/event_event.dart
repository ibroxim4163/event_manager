part of 'event_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();
}

class LoadedEvent extends HomeEvent {
  const LoadedEvent();
}

class ErrorEvent extends HomeEvent {
  const ErrorEvent();
}

class ChangeDateEvent extends HomeEvent {
  final DateTime selectedDate;
  const ChangeDateEvent(this.selectedDate);
}

class CreateTodo extends HomeEvent {
  final TodoModel todo;
  const CreateTodo(this.todo);
}

class UpdateTodo extends HomeEvent {
  final TodoModel todo;
  final int id;
  const UpdateTodo({
    required this.id,
    required this.todo,
  });
}

class DeleteTodo extends HomeEvent {
  final int id;
  const DeleteTodo(this.id);
}
