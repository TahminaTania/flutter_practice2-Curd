import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_p2/features/showdata/model/todo_model.dart';
import 'package:flutter_p2/features/showdata/model/usermode.dart';
import 'package:flutter_p2/features/showdata/repo/repository.dart';

part 'fetchdata_state.dart';

class FetchdataCubit extends Cubit<DataState> {
  final DataRepository repository;
  FetchdataCubit(this.repository) : super(DataInitial());

  Future<void> fetchData() async {
    try {
      final todos = await repository.fetchData();
      emit(DataLoadedState(todos));
    } catch (e) {
      emit(DataErrorState('Failed to fetch todos'));
    }
  }

  Future<void> addData(TodoModel todo) async {
    try {
      final updatedTodos = await repository.addTodo(todo);
      final currentState = state; // Get the current state
      if (currentState is DataLoadedState) {
        final currentTodos =
            currentState.todos; // Get the current list of todos
        final updatedList = List<TodoModel>.from(
            currentTodos); // Create a new list based on the current list
        updatedList.add(todo); // Add the new todo to the list
        emit(DataLoadedState(updatedList)); // Emit the updated list of todos
      }
    } catch (e) {
      emit(DataErrorState('Failed to add todo'));
    }
  }

  void deleteDataById(int id) async {
    try {
      // Delete the todo item from the repository
      await repository.deleteTodoById(id);

      // Get the current state
      final currentState = state;

      if (currentState is DataLoadedState) {
        // Filter out the deleted todo from the current todo list
        final updatedTodos =
            currentState.todos.where((todo) => todo.id != id).toList();

        // Update the state with the updated todo list
        emit(DataLoadedState(updatedTodos));
      }
    } catch (e) {
      emit(DataErrorState('Failed to delete todo'));
    }
  }

  void editData(TodoModel updatedTodo) {
    final currentTodos = state.todos;
    final updatedTodos = currentTodos.map((todo) {
      if (todo.id == updatedTodo.id) {
        return updatedTodo;
      } else {
        return todo;
      }
    }).toList();
    emit(DataLoadedState(updatedTodos));
  }
}
