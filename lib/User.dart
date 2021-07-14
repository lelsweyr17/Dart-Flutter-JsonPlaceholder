import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  final String name;
  final String email;
  final String username;
  final int id;

  User({required this.name, required this.email, required this.username, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'id': id,
    };
  }
}

Future<List<User>> fetchUser() async {
  List<User> users = [];
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
  var jsonData = jsonDecode(response.body);
  for (var i in jsonData) {
    User user =
        User(name: i['name'], email: i['email'], username: i['username'], id: i['id']);
    users.add(user);
  }
  if (response.statusCode == 200) {
    return users;
  } else {
    throw Exception('Failed to load user data');
  }
}
