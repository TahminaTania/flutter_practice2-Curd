import 'dart:convert';

import 'package:flutter_p2/core/constant/constant_apis.dart';
import 'package:flutter_p2/features/showdata/model/todo_model.dart';
import 'package:flutter_p2/features/showdata/model/usermode.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class DataRepository {
  // final http.Client httpClient;
  // DataRepository(this.httpClient);

  String todoUrl = apiConstants.BaseUrl + apiConstants.todos;

  Future<List<TodoModel>> fetchData() async {
    Response response = await get(Uri.parse(todoUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TodoModel.fromJson(e)).toList();
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }

  Future<List<TodoModel>> addTodo(TodoModel todo) async {
    try {
      final response = await http.post(
        Uri.parse(todoUrl),
        body: json.encode(todo.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        final dynamic data = json.decode(response.body);
        final updatedTodo = TodoModel.fromJson(data);
        final currentTodos = await fetchData();
        final updatedTodos = [...currentTodos, updatedTodo];
        return updatedTodos;
      } else {
        throw Exception('Failed to add todo');
      }
    } catch (e) {
      throw Exception('Failed to add todo');
    }
  }

  Future<void> updateTodoById(TodoModel todo) async {
    final response = await http.put(
      Uri.parse('$todoUrl/${todo.id}'),
      body: jsonEncode(todo.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update todo.');
    }
  }

  Future<void> deleteTodoById(int id) async {
    final response = await http.delete(Uri.parse('$todoUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }
}
