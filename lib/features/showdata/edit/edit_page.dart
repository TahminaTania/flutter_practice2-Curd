import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_p2/features/showdata/cubit/fetchdata_cubit.dart';
import 'package:flutter_p2/features/showdata/model/todo_model.dart';

class EditDialog {
  static void showEditTodoDialog(BuildContext context, TodoModel todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedTitle = todo.title;

        return AlertDialog(
          title: Text('Edit Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  updatedTitle = value;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: TextEditingController(text: todo.title),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedTodo = TodoModel(
                  id: todo.id,
                  title: updatedTitle,
                  completed: todo.completed,
                );
                context.read<FetchdataCubit>().editData(updatedTodo);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
