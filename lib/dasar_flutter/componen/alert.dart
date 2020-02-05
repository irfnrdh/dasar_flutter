import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  void show_dialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Peringatan'),
          content: Text('Kamu mau keluar?'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          show_dialog();
        },
        child: Text('Belajar Alert'),
      )),
    );
  }
}
