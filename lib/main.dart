import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_placeholder/User.dart';
import 'package:json_placeholder/ThemeData.dart';
import 'package:json_placeholder/modalBottomSheet.dart';

bool lightMode = true;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
        // ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Users',
      theme: lightTheme(),
      home: Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          title: Text('Users'),
          backgroundColor: Colors.indigo[200],
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  iconSize: 30.0,
                  icon: (lightMode == true)
                      ? Icon(Icons.dark_mode_outlined,
                          color: Colors.black87)
                      : Icon(Icons.light_mode_outlined,
                          color: Colors.white),
                  onPressed: () {
                    setState(() {
                      lightMode = !lightMode;
                      // if (lightMode == false) {
                      //   _themeChanger.setLightTheme();
                      // } else {
                      //   _themeChanger.setDarkTheme();
                      // }
                    });
                  }),
            ),
          ],
          leadingWidth: 90.0,
          elevation: 0.0,
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 0.5,
                        child: ListTile(
                          title: Text(snapshot.data![i].name),
                          subtitle: Text(snapshot.data![i].username),
                          leading: Icon(Icons.person_outline,
                              size: 50.0, color: Colors.black),
                          onTap: () {
                            modalBottomSheet(context, snapshot, i);
                          },
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
