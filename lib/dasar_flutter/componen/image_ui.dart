import 'package:flutter/material.dart';

class ImageUi extends StatefulWidget {
  ImageUi({Key key}) : super(key: key);

  @override
  _ImageUiState createState() => _ImageUiState();
}

class _ImageUiState extends State<ImageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Belajar Import Image'),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/web_logo.png', height: 150.0, width: 150.0),
            Image.network(
              'http://www.udacoding.com/wp-content/uploads/2019/01/50091873_179313046362219_4720222159456753743_n-768x576.jpg',
              height: 150.0,
              width: 150.0,
            ),
          ],
        ));
  }
}
