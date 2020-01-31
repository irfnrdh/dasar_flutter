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
          // List Biasa
          ListTile(
            title: Text('Test'),
            subtitle: Text('Apa Aja!'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print('Hellow!');
              },
            ),
            onTap: () {
              print('Hello');
            },
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/fit/c/160/160/1*zePc2RtjyFLaETq2bGJosA.png'),
              child: Image(
                  image: NetworkImage(
                      'https://miro.medium.com/fit/c/160/160/1*zePc2RtjyFLaETq2bGJosA.png')),
            ),
          ),

          // List yang dapat expansi
          ExpansionTile(
            title: Text('Bonus'),
            subtitle: Text('Mantull'),
            trailing: Icon(Icons.access_alarms),
            leading: Icon(Icons.accessibility),
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
                onTap: () {
                  print('Hello');
                },
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      'https://miro.medium.com/fit/c/160/160/1*zePc2RtjyFLaETq2bGJosA.png'),
                  child: Image(
                      image: NetworkImage(
                          'https://miro.medium.com/fit/c/160/160/1*zePc2RtjyFLaETq2bGJosA.png')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
