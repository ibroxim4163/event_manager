import 'package:event_task/data/models/todo_model.dart';

import '../local_structure/todo_local_structure.dart';

class TodoRepository {
  final LocalDataStructure localDataStructure;
  TodoRepository(this.localDataStructure);

  Future<bool> createTodo(TodoModel todo) async {
    try {
      Map<String, Object?> data = todo.toJson();
      data.remove("id");
     
      await localDataStructure.insert(data: data);
      return true;
    } catch (e, s) {
      print("$e$s");

      return false;
    }
  }

  Future<bool> deleteData(int id) async {
    try {
      await localDataStructure.delete(id: id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TodoModel>> getAllData() async {
    try {
      final response = await localDataStructure.readAll();
      return response.map((e) => TodoModel.fromJson(e)).toList();
    } catch (e,s) {
      print("$e$s");
      return [];
    }
  }

  Future<bool> getData(int id) async {
    try {
      await localDataStructure.read(id: id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TodoModel>> getFilterdData(DateTime time) async {
    try {
      final response = await localDataStructure.readFilteredData(time);
      return response.map((e) => TodoModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> updateData(TodoModel todo, int id) async {
    try {
      await localDataStructure.update(data: todo.toJson(), id: id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
