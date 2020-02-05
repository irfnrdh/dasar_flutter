import 'package:flutter/material.dart';

class AlertUi extends StatefulWidget {
  @override
  _AlertUiState createState() => _AlertUiState();
}

class _AlertUiState extends State<AlertUi> {
  void _showDialog() {
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
          _showDialog();
        },
        child: Text('Belajar Alert'),
      )),
    );
  }
}
