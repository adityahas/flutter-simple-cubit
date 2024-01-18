import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Todos'),
        centerTitle: true,
      ),
      // (type of bloc, state)
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todo) {
        return ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(todo[index].title),
              subtitle: Text(todo[index].description),
            );
          });
  }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddTodoPage()));
        },
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
