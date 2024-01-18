import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _titleController= TextEditingController();
  final TextEditingController _descController= TextEditingController();
  @override
  Widget build(BuildContext context) {
     final todoCubit= BlocProvider.of<TodoCubit>(context);
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Enter your title',
            ),
          ),
          TextField(
            controller: _descController,
            decoration:const InputDecoration(
              labelText: 'Enter the description'
            ),
          ),

          ElevatedButton(onPressed: (){
            todoCubit.addTodo(_titleController.text, _descController.text);
            Navigator.of(context).pop();
          }, child: const Text('Add Todo'))
        ]),
      ),
    );
  }
}