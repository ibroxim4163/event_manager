import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/todo_model.dart';
import '../../data/repository/todo_repository.dart';
import 'events_model.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<HomeEvent, EventState> {
  final TodoRepository repository;

  EventBloc({required this.repository})
      : super(
          LoadedState(
            EventTodo(
              allTodos: [],
              todos: [],
              current: DateTime.now(),
            ),
          ),
        ) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        LoadingEvent e => _loading(e, emit),
        LoadedEvent _ => () {},
        ErrorEvent _ => () {},
        CreateTodo e => _create(e, emit),
        DeleteTodo e => _delete(e, emit),
        UpdateTodo e => _update(e, emit),
        ChangeDateEvent e => _changeDate(e, emit),
      },
    );
  }

  void _loading(LoadingEvent e, Emitter<EventState> emit) async {
    emit(LoadingState(state.eventTodo));

    try {
      List<TodoModel> allTodo = await repository.getAllData();
      List<TodoModel> filteredData =
          await repository.getFilterdData(state.eventTodo.current);
      emit(
        LoadingState(
          EventTodo(
            allTodos: allTodo,
            todos: filteredData,
            current: state.eventTodo.current,
          ),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          state.eventTodo,
          message: "$e",
        ),
      );
    }
  }

  void _create(CreateTodo e, Emitter<EventState> emit) async {
    try {
      await repository.createTodo(e.todo);
    } catch (e) {
      emit(ErrorState(state.eventTodo, message: "$e"));
    }
  }

  void _delete(DeleteTodo e, Emitter<EventState> emit) async {
    try {
      await repository.deleteData(e.id);
    } catch (e) {
      emit(
        ErrorState(state.eventTodo, message: "$e"),
      );
    }
  }

  void _update(UpdateTodo e, Emitter<EventState> emit) async {
    try {
      await repository.updateData(e.todo, e.id);
    } catch (e) {
      emit(ErrorState(state.eventTodo, message: "$e"));
    }
  }

  void _changeDate(ChangeDateEvent e, Emitter<EventState> emit) async {
    final List<TodoModel> filteredData =
        await repository.getFilterdData(e.selectedDate);
    EventTodo eventTodo = EventTodo(
      allTodos: state.eventTodo.allTodos,
      todos: filteredData,
      current: e.selectedDate,
    );
    emit(
      LoadedState(eventTodo),
    );
  }
}
