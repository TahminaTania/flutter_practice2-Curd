import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_p2/features/showdata/DialougeBox/dialoges.dart';
import 'package:flutter_p2/features/showdata/add/add_data_page.dart';
import 'package:flutter_p2/features/showdata/cubit/fetchdata_cubit.dart';
import 'package:flutter_p2/features/showdata/edit/edit_page.dart';

class DataPage extends StatefulWidget {
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  //final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<FetchdataCubit>();
    cubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: BlocConsumer<FetchdataCubit, DataState>(
        listener: (context, state) {
          if (state is DataErrorState) {
            DialougesBar.showAlertDialog(
              context,
              'Error',
              state.errorMessage,
              () => Navigator.pop(context),
            );
          }
        },
        builder: (context, state) {
          if (state is DataLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoadedState) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return ListTile(
                  title: Text(todo.title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          EditDialog.showEditTodoDialog(context, todo);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          DialougesBar.showDeleteConfirmationDialog(
                              context, todo);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is DataErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddDataPage()), // Navigate to AddDataPage
          );
        },
      ),
    );
  }
}
