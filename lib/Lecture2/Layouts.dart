import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      /*******************--[focus here 🧐]--*******************/
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      child:
      /*******************--[focus here 🧐]--*******************/

      Container(
        color: Colors.yellow,
        child: Center(
          child: Icon(
            Icons.done,
            size: 200,
            color: Colors.red,
          ),
        ),
      )



      /*******************--[focus here 🧐]--*******************/
    );
  }

  Container containerExample() {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.purple,
        border: Border.all(color: Colors.black, width: 5),
        shape: BoxShape.rectangle
      ),
      child: Center(
        child: Text(
          'Hello Container',
          style: TextStyle(fontSize: 30, fontFamily: 'casual'),
        ),
      ),
    );
  }
}
