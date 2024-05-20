import 'dart:convert';
import 'package:http/http.dart' as http;

// All the backend API will be handled by TodoServices class.
class TodoService{
  static Future<bool> deleteById(int id) async {
    final response = await http.delete(
        Uri.parse('http://localhost:9090/api/v1/todos/${id}'),
        headers: {"accept": "application/json"});
    return response.statusCode == 200;
  }


  static Future<List?> fetchTodo() async {

    final response = await http.get(
        Uri.parse('http://localhost:9090/api/v1/todos'),
        headers: {"accept": "application/json"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final items = json['data'] as List;
      return items;
    } else {
      // return null if error occurs
      return null;
    }

  }

}