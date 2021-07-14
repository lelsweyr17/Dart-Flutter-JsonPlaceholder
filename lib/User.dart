import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<User>> fetchUser() async {
  List<User> users = [];
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
  var jsonData = jsonDecode(response.body);
  for (var i in jsonData) {
    User user =
        User(name: i['name'], email: i['email'], username: i['username'], phone: i['phone'], website: i['website']);
    users.add(user);
  }
  if (response.statusCode == 200) {
    return users;
  } else {
    throw Exception('Failed to load data');
  }
}

class User {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String website;

  User({required this.name, required this.email, required this.username, required this.phone, required this.website});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'phone': phone,
      'website': website,
    };
  }
}
