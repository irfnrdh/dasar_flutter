//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    var box = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey, Colors.white])),
      //color: Colors.red,
      margin: EdgeInsets.only(top: 52.0),
      padding: EdgeInsets.all(16.0),
      width: 300,
      height: 200,
      child: Text('Yey'),
    );

    var label = Text('Hello');

    var baris = Row(children: <Widget>[box, box, label]);

    var vertikal = Column(
      children: <Widget>[label, box, box, baris],
    );

    var tombol = RaisedButton(
      child: Text("Button"),
      onPressed: () {},
    );

    var tumpuk = Stack(
      children: <Widget>[box, tombol],
    );

    return Scaffold(
      body: Center(
        child: tumpuk,
      ),
    );
  }
}
