import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // to change your app color change this
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Flower Shop',
            style: TextStyle(fontFamily: 'casual'),
          ),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            flowerDetails(context),
          ],
        ));
  }
}

Widget flowerDetails(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imageGroup(),
        titleGroup(),
        iconGroup(),
        textGroup(),
        buttonGroup(),
      ],
    ),
  );
}

/// Image work on Mobile https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg
/// Image hat works on Web: https://ichef.bbci.co.uk/images/ic/640x360/p046xkbw.jpg
/// when i use first:
// The following SocketException was thrown resolving an image codec:
// Connection reset by peer (OS Error: Connection reset by peer, errno = 104), address = ichef.bbci.co.uk, port = 41668
// when i use second:
// The following NetworkImageLoadException was thrown resolving an image codec:
// HTTP request failed, statusCode: 404, https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg
Widget imageGroup() {
  return Image.network(
    "https://prixoxo.ru/uploads/posts/2021-08/zheltyj-cvet-kartinki-i-krasivye-foto-5.jpg",
    fit: BoxFit.cover,
  );
}

Widget titleGroup() {
  return const ListTile(
    title: Text("Sunny Flowers"),
    titleTextStyle:
        TextStyle(fontSize: 52, fontFamily: 'cursive', color: Colors.black),
    subtitle: Text("12 dosen"),
    subtitleTextStyle: TextStyle(color: Colors.black54, fontSize: 14),
  );
}

Widget iconGroup() {
  // return Text('Replace with icons group');
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.share, color: Colors.indigo, size: 40),
        Icon(Icons.favorite, color: Colors.indigo, size: 40),
      ],
    ),
  );
}

/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return const Padding(
    padding: EdgeInsets.only(top: 16, bottom: 40),
    child: Text(
      'Lorem Ipsum, is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s',
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'casual',
      ),
    ),
  );
}

Widget buttonGroup() {
  // return Text('Replace with button group');
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 10,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 13),
      backgroundColor: Colors.indigo,
    ),
    onPressed: () {},
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.add_shopping_cart, color: Colors.white),
        Text(
          "ADD TO CHART",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
