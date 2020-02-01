// "is_enabled": true,
// "is_real": false,
// "entry": 14000,
// "martingale": 4,

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String email;
  String displayName;
  bool isEnabled;

  User({this.email, this.displayName, this.isEnabled});

  Map<String, dynamic> toJson() => {
        "email": email,
        "display_name": displayName,
        "is_enabled": isEnabled,
      };

  @override
  String toString() => toJson().toString();
}

final listUser = [
  User(
    email: 'rizal@gmail.com',
    displayName: 'Rizal',
    isEnabled: true,
  ),
  User(
    email: 'rizal@gmail.com',
    displayName: 'Rizal',
    isEnabled: true,
  ),
  User()
    ..email = 'irfan@gmail.com'
    ..displayName = 'Irfan'
    ..isEnabled = false,
];

class DashboardUi extends StatefulWidget {
  @override
  _DashboardUiState createState() => _DashboardUiState();
}

class _DashboardUiState extends State<DashboardUi> {
  bool switchControl = false;
  var textHolder = 'switch';

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
        textHolder = 'Status robot ON';
      });
      print('Switch is ON');
    } else {
      setState(() {
        switchControl = false;
        textHolder = 'Status robot OFF';
      });
      print('Switch is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = listUser.map((user) {
      return ExpansionTile(
        title: Text('${user.displayName}'.toUpperCase()),
        subtitle: Text('${user.email}'),
        trailing: Icon(Icons.expand_more),
        leading: Icon(Icons.people),
      );
    }).toList();

    final items2 = listUser.map((user) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        elevation: 0.5,
        child: ExpansionTile(
          title: Text('${user.displayName}'.toUpperCase()),
          subtitle: Text('${user.email}'),
          trailing: Icon(Icons.expand_more),
          leading: Icon(Icons.people),
          children: <Widget>[
            ListTile(
              //contentPadding: EdgeInsets.only(left: 80.0),
              title: Text('Enable'),
              subtitle: Text(textHolder),
              trailing: Switch(
                onChanged: toggleSwitch,
                value: switchControl,
                activeColor: Colors.blue,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              ),
              leading: null,
            ),
            ListTile(
              title: Text('Martingale'),
              subtitle: Text('Jumlah martingale'),
              trailing: Text('4'),
              leading: null,
              onTap: () {
                print('Hello');
              },
            ),
            ListTile(
              title: Text('Entry'),
              subtitle: Text('Jumlah enty'),
              trailing: Text('14000'),
              leading: null,
              onTap: () {
                print('Hello');
              },
            ),
          ],
        ),
      );
    }).toList();

    final dividerElement = ListTile.divideTiles(
      context: context,
      tiles: items2,
    );

    final body = ListView.builder(
      itemCount: items2.length + 1,
      itemBuilder: (_, i) {
        if (i == 0) {
          return Container(
            color: Colors.green,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Lorem ipsum'),
              ),
            ),
          );
        }
        return items2[i - 1];
      },
    );

    final list = ExpansionTile(
      title: Text('Darmono'),
      //subtitle: Text('premium'),
      trailing: Icon(Icons.expand_more),
      leading: Icon(Icons.people),
      children: <Widget>[
        ListTile(
          //contentPadding: EdgeInsets.only(left: 80.0),
          title: Text('Enable'),
          subtitle: Text(textHolder),
          trailing: Switch(
            onChanged: toggleSwitch,
            value: switchControl,
            activeColor: Colors.blue,
            activeTrackColor: Colors.green,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
          leading: null,
        ),
        ListTile(
          title: Text('Martingale'),
          subtitle: Text('Jumlah martingale'),
          trailing: Text('4'),
          leading: null,
          onTap: () {
            print('Hello');
          },
        ),
        ListTile(
          title: Text('Entry'),
          subtitle: Text('Jumlah enty'),
          trailing: Text('14000'),
          leading: null,
          onTap: () {
            print('Hello');
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: body,
    );
  }
}
