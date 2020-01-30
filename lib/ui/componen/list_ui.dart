import 'package:flutter/material.dart';

class ListUi extends StatefulWidget {
  @override
  _ListUiState createState() => _ListUiState();
}

class _ListUiState extends State<ListUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
              title: Text('Test'),
              subtitle: Text('Apa Aja!'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print('Hellow!');
                },
              ),

              // Icon(
              //   Icons.arrow_back,
              //   color: Colors.blue,
              // ),
              onTap: () {
                print('Hello');
              },
              leading: Image.network(
                  'https://miro.medium.com/fit/c/160/160/1*zePc2RtjyFLaETq2bGJosA.png')),
        ],
      ),
    );
  }
}
