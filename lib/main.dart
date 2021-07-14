import 'package:flutter/material.dart';
import 'package:json_placeholder/User.dart';
import 'package:json_placeholder/ToDo.dart';
import 'package:json_placeholder/ModalBottomSheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<User>> futureUser;
  late Future<List<ToDo>> futureToDo;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
    futureToDo = fetchToDo();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchUser();
        fetchToDo();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        canvasColor: Colors.transparent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Center(
          child: FutureBuilder<List<ToDo>>(
            future: fetchToDo(),
          // child: FutureBuilder<List<User>>(
          //   future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data![i].title),
                          leading: (snapshot.data![i].completed == true
                              ? Icon(Icons.done, color: Colors.green)
                              : Icon(Icons.block, color: Colors.red)),
                          // title: Text(snapshot.data![i].name),
                          // subtitle: Text(snapshot.data![i].username),
                          onTap: () {
                            modalBottomSheet(context, snapshot.data![i]);
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
