import 'dart:convert';
import 'package:flutter/material.dart';
import 'AddPostScreen.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class Post {
  late int userId;
  late int id;
  late String title;
  late String body;

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? '';
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    body = json['body'] ?? '';
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal, accentColor: Colors.blueGrey)),
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
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, AddPostScreenTemplate.getRoute(context));
          },
          child: Icon(Icons.add_comment_sharp),
        ),
        body: posts.isEmpty ? buildEmptyView() : buildUserList());
  }

  buildUserList() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index].title),
          subtitle: Text(posts[index].body),
        );
      },
    );
  }


  Widget buildEmptyView() {
    return FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            posts = snapshot.data!;
            return buildUserList();
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Future<List<Post>> getPosts() async {
    List<Post> postsList = [];

    ///Exercise 1 call API here
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      list.forEach((element) {
        Post post = Post.fromJson(element);
        postsList.add(post);
      });
      return postsList;
    }
    return [];
  }
}
