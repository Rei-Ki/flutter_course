import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//

class AddPostScreenTemplate extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return AddPostScreenTemplate();
    });
  }

  const AddPostScreenTemplate({Key? key}) : super(key: key);

  @override
  _AddPostScreenTemplateState createState() => _AddPostScreenTemplateState();
}

class _AddPostScreenTemplateState extends State<AddPostScreenTemplate> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new user'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                filled: true,
                hintText: 'write title here...',
                labelText: 'title ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: 'write message text here...',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                /// Exercise 5 call addComment with Named parameter
                addComment(title: titleController.text, body: bodyController.text);
              },
              child: Text("Add Comment".toUpperCase()),
            )
          ],
        ),
      ),
    );
  }

  addComment(
      {required String title,
    required String body}) async {
    /// Exercise 5 call Post API here
    var response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        "title": title,
        "body": body,
        "userId": "1",
      }),
    );

    if (response.statusCode == 201) {
      print(response.statusCode);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Post added")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("error: ${response.reasonPhrase}")));
    }

  }
}
