import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map todo;
  final int todoId;
  final Function(Map) navigateToEditTodo;
  final Function(int) deleteTodoById;
  const TodoCard({
    super.key,
    required this.index,
    required this.todo,
    required this.todoId,
    required this.navigateToEditTodo,
    required this.deleteTodoById,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text("${index + 1}")),
        title: Text(todo['title']),
        subtitle: Text(todo['description']),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == "edit") {
              // Navigate to edit screen
              navigateToEditTodo(todo);
            } else {
              // Delete todo from server and refresh todo list
              deleteTodoById(todoId);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text("Edit"),
              value: "edit",
            ),
            const PopupMenuItem(
              child: Text("Delete"),
              value: "delete",
            ),
          ],
        ),
      ),
    );
  }
}
