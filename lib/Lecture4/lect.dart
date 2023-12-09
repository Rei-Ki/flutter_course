import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  bool isOpened = true;
  int counter = 0;
  bool isClicked = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Lab 3',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        height: isOpened ? screenHeight : 60,
        // to 0 when click on it, to screen height when also click on it
        color: Colors.indigo,
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Click to Expand',
                      style: TextStyle(fontSize: 18),
                    )),
                    Icon(Icons.keyboard_arrow_up),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeShapes(screenWidth),
                    flutterChanger(screenWidth),
                    showHide(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeShapes(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                      print(isClicked);
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: isClicked ? Colors.blue : Colors.red,
                      shape: isClicked ? BoxShape.circle : BoxShape.rectangle,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: isClicked ? Colors.red : Colors.blue,
                    shape: isClicked ? BoxShape.rectangle : BoxShape.circle,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget flutterChanger(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,

          /// ********** Do changes in child below ********** ///
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(
                style: checkLogo(),
                size: 100,
              ),
              InkWell(
                child: Icon(
                  Icons.refresh,
                  size: 30,
                ),
                onTap: () {
                  setState(() {
                    counter++;
                    if (counter > 2) counter = 0;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  FlutterLogoStyle checkLogo() {
    if (counter == 0)
      return FlutterLogoStyle.markOnly;
    else if (counter == 1)
      return FlutterLogoStyle.stacked;
    else
      return FlutterLogoStyle.horizontal;
  }

  Widget showHide(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isVisible ? Icon(Icons.favorite, size: 100, color: Colors.red,) : Container(),
                InkWell(child: Icon(!isVisible ? Icons.lock : Icons.lock_open, size: 50, color: Colors.purple,),
                onTap: (){
                  setState(() {
                    isVisible = !isVisible;
                  });
                },)

              ],
            )),
      ),
    );
  }
}
