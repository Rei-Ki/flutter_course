import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/userLesson/addUser.dart';
import 'package:flutter_course/userLesson/user.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddUserScreen.getRoute(context));
        },
        child: Icon(Icons.person_add),
      ),
      body: users.isEmpty ? buildEmptyView() : createListView(),
    );
  }

  Widget buildEmptyView() {
    return FutureBuilder<List<User>>(
        future: getUserApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            users = snapshot.data!;
            return createListView();
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Future<List<User>> getUserApi() async {
    List<User> usersList = [];

    Uri url = Uri.parse("https://gorest.co.in/public/v2/users");
    var respose = await http.get(url);

    if (respose.statusCode == 200) {
      var list = jsonDecode(respose.body) as List;
      list.forEach((element) {
        User user = User.fromJson(element);
        usersList.add(user);
      });
      return usersList;
    }
    return [];
  }

  Widget createListView() {
    return RefreshIndicator(
      onRefresh: () async {
        users = [];
        await getUserApi();
        return Future.value(true);
      },
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(users[index].name, style: TextStyle(fontSize: 18)),
                subtitle: Text(
                  users[index].email,
                ),
                leading: Icon(users[index].gender == 'female'
                    ? Icons.female
                    : Icons.male),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
