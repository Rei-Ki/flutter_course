import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/Bloc_lab/bloc/api_events.dart';
import 'Todo.dart';
import 'bloc/api_bloc.dart';
import 'bloc/api_states.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: BlocProvider(
        create: (_) => ApiBloc(),
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
  List<Todo> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBloc, ApiStates>(builder: (context, state) {
      if (state is InitialState){
        return buildInitialView();
      }
      if (state is LoadingState){
        return const Center(child: CircularProgressIndicator());
      }
      if (state is SuccessTodoState){
        List<Todo> todos = state.todos;
        return buildUserList(todos);
      }
      if (state is FailureState){
        return const Center(child: Text("Oops, Something went wrong"));
      }
      return const Text("Nothing");
    });
  }

  Center buildInitialView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            /// call bloc and send event
            context.read<ApiBloc>().add(GetToDoEvent());
          },
          child: Text("Get TODO".toUpperCase())),
    );
  }

  Widget buildUserList(List<Todo> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${users[index].title}"),
          leading: Icon(Icons.calendar_today_outlined),
          trailing: Icon(users[index].completed ? Icons.close : Icons.check),
        );
      },
    );
  }
}
