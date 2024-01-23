import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_and_swutchbutton_using_bloc/bloc/todo/to_do_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() {
    return _ToDoScreenState();
  }
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state)
    {
      if (state.todosList.isEmpty) {
        return const Center(child: Text('No todo found'),);
      }
      else if (state.todosList.isNotEmpty) {
        return ListView.builder(
          itemCount: state.todosList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.todosList[index].toString()),
             //  title: Text(index.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<ToDoBloc>().add(RemoveToDoEvent(task: state.todosList[index],));
                },
              ),
            );
          },
        );
      }
      else {
        return const Center(child: CircularProgressIndicator(),);
      }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i = 0; i<5; i++) {
            context.read<ToDoBloc>().add(AddToDoEvent(task:'Task $i',));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}