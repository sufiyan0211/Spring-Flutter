import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodo extends StatefulWidget {
  final Map? todo;

  const AddTodo({Key? key, this.todo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isEdit =
      false; // By default this page is for adding todo not for edit todo

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todo != null) {
      isEdit = true;
      titleController.text = widget.todo!['title'];
      descriptionController.text = widget.todo!['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            isEdit ? 'Edit Todo' : 'Add Todo',
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
              ),
              minLines: 3,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: isEdit ? updateTodo : submitTodo,
              child: Text(isEdit ? "Update" : 'Submit'),
            )
          ],
        ));
  }

  Future<void> updateTodo() async {
    final id = widget.todo!['id'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {"title": title, "description": description};

    // post data to server
    final response = await http.put(
        Uri.parse('http://localhost:9090/api/v1/todos/$id'),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json"
        });

    // return success or failure

    if (response.statusCode == 201 || response.statusCode == 200) {
      print("Successfully Updated");
      showSuccessMessage("Successfully Updated");
    } else {
      print("Failed to Update");
      print("ResponseStatusCode: " + response.statusCode.toString());
      print("ResponseBody: " + response.body);
      showFailuresMessage("Failed to Update");
    }
  }

  Future<void> submitTodo() async {
    // Get data from form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    // post data to server
    final response = await http.post(
        Uri.parse('http://localhost:9090/api/v1/todos'),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json"
        });

    // return success or failure

    if (response.statusCode == 201 || response.statusCode == 200) {
      print("Success Creation");
      showSuccessMessage("Success Creation");
    } else {
      print("Failed Creation");
      print("ResponseStatusCode: " + response.statusCode.toString());
      print("ResponseBody: " + response.body);
      showFailuresMessage("Failed Creation");
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showFailuresMessage(String message) {
    final snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
