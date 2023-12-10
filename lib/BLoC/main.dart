import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/BLoC/bloc/extract_bloc.dart';
import 'package:flutter_course/BLoC/bloc/extract_event.dart';
import 'package:flutter_course/BLoC/bloc/extract_state.dart';
import 'addUser.dart';
import 'user.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  BlocProvider(
        create: (BuildContext context) => ApiBloc(),
      child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
      body: buildBloc(),
    );
  }

  buildBloc() {
    return BlocBuilder<ApiBloc, ApiStates>(builder: (context, state) {
      if (state is InitialState) {
        return buildInitialView();
      }
      if (state is LoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is SuccessUserListState) {
        List<User> user = state.users;
        return buildUserList(user);
      }
      if (state is FailureState) {
        return Center(child: Text("Error while Connecting"));
      }

      return Text("Nothing");
    });
  }

  Widget buildInitialView() {
    return Center(
      child: ElevatedButton(onPressed: (){
        context.read<ApiBloc>().add(GetUserListEvent());
      }, child: Text("Get Users".toUpperCase())),
    );
  }

  Widget buildUserList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
              title: Text("${users[index].name}"),
              subtitle: Text("${users[index].email}"),
              leading: Icon(Icons.person),
            );
      },
    );
  }
}

