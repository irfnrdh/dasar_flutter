import 'package:flutter/material.dart';

class SnackDialogScreen extends StatefulWidget {
  @override
  _SnackDialogScreenState createState() => _SnackDialogScreenState();
}

class _SnackDialogScreenState extends State<SnackDialogScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _appBar = AppBar(
      title: Text('Akungeblog'),
      centerTitle: true,
    );

    var _body = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Show Alert'),
            onPressed: () => tampilDialog(context),
          ),
          SizedBox(height: 8.0),
          RaisedButton(
            child: Text('Show Option'),
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          RaisedButton(
            child: Text('Show Snacbar'),
            onPressed: () {},
          ),
        ],
      ),
    );
    return Scaffold(
      key: _key,
      appBar: _appBar,
      body: _body,
    );
  }

// fungsi untuk menampilkan alert dialog
  tampilDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        child: AlertDialog(
          title: Text('Hello'),
          content: Text('Halo ini adalah isi dialaog'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ));
  }
}

// fungsi untuk menampilkan option dialog
// tampilOption(BuildContext ctx){
//   showDialog(
//     context: ctx,
//     barrierDismissible: false,
//     child: AlertDialog(
//       title: Text('Option Dialog'),
//       content: Text('Halo Ini adalah isi Dialog'),
      
//     )
//   ),
// }