import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ToDo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDo({
      required this.userId,
      required this.id,
      required this.title,
      required this.completed
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}

Future<List<ToDo>> fetchToDo() async {
  List<ToDo> todos = [];
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'todos'));
  var jsonData = jsonDecode(response.body);
  for (var i in jsonData) {
    ToDo todo = ToDo(
        userId: i['userId'],
        id: i['id'],
        title: i['title'],
        completed: i['completed']);
    todos.add(todo);
  }
  if (response.statusCode == 200) {
    return todos;
  } else {
    throw Exception('Failed to load todo data');
  }
}
