import 'package:dio/dio.dart';
import 'package:todo_list/src/models/todo_models.dart';

class TodoRepository {
  Dio? dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository(Dio? client) : dio = client ?? Dio();

  Future<List<TodoModal>> fetchTodos() async {
    final response = await dio!.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModal.fromJson(json)).toList();
    // List<TodoModal> todos = [];

    // for (var json in list) {
    //   final todo = TodoModal.fromJson(json);

    //   todos.add(todo);
    // }

    // return todos;
  }
}
