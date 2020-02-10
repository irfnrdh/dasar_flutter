import 'package:dasar_flutter/config.dart';
import 'package:dasar_flutter/latihan_auth/login_ui.dart';
import 'package:flutter/material.dart';
import '../hive_db.dart';

class Home extends StatelessWidget {
  static String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final _repo = Hivedb();

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder(
          future: _repo.itemHiveDb(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print('Home ya, ${snapshot.data}');

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hello'),
                    RaisedButton(
                        child: Text('Logout'),
                        onPressed: () {
                          _repo.deleteHiveDb(snapshot.data['uid']);
                          FirestoreDart.auth.signOut();
                          print('Berhasil Logout');
                          Navigator.pushNamed(context, LoginUi.tag);
                        })
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Container(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
