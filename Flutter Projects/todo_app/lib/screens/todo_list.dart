import 'package:flutter/material.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/widget/todo_card.dart';

import 'add_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListOfTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: RefreshIndicator(
        onRefresh: getListOfTodos,
        child: Visibility(
          visible: todos.isNotEmpty,
          replacement: const Center(
            child: Text(
              "No todo items",
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
          child: ListView.builder(
            itemCount: todos.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final todo = todos[index] as Map;
              final todoId = todo['id'] as int;
              return TodoCard(
                  index: index,
                  todo: todo,
                  todoId: todoId,
                  navigateToEditTodo: navigateToEditTodo,
                  deleteTodoById: deleteTodoById
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddTodo, label: Text("Add Todo")),
    );
  }

  Future<void> navigateToAddTodo() async {
    final route = MaterialPageRoute(builder: (context) => AddTodo());
    await Navigator.push(context, route);
    getListOfTodos();
  }

  Future<void> navigateToEditTodo(Map todo) async {
    final route = MaterialPageRoute(builder: (context) => AddTodo(todo: todo));
    await Navigator.push(context, route);
    getListOfTodos();
  }

  Future<void> getListOfTodos() async {
    // Get list of todos

    final response = await TodoService.fetchTodo();

    if (response != null) {

      setState(() {
        todos = response;
      });
    } else {
      // print error to user
      print("Error fetching todos");
    }
  }

  Future<void> deleteTodoById(int todoId) async {
    final isSuccess = await TodoService.deleteById(todoId);

    if (isSuccess) {
      final updatedTodos = todos.where((todo) {
        final id = todo['id'] as int;
        return id != todoId;
      }).toList();

      setState(() {
        todos = updatedTodos;
      });
    } else {
      // print error to user
      print("Error deleting todo");
    }
  }
}
