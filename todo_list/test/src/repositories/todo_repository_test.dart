import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final repository = TodoRepository(dio);

  test("deve tazer uma lista de Todo models", () async {
    final url = 'https://jsonplaceholder.typicode.com/todos';

    when(dio.get("")).thenAnswer((_) async => Response(
        data: jsonDecode(jsonData), requestOptions: RequestOptions(path: "")));

    final list = await repository.fetchTodos();

    expect(list[1].title, "quis ut nam facilis et officia qui");
  });
}

String jsonData = '''
[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  },
]
''';
