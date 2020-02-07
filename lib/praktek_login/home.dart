import 'package:dasar_flutter/praktek_login/login_ui.dart';
//import 'package:dasar_flutter/model/user.dart';
import 'package:flutter/material.dart';
import '../hive_db.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);
  // var id = null;

  @override
  Widget build(BuildContext context) {
    final _repo = Hivedb();
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder(
          future: _repo.itemHiveDb(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.connectionState == ConnectionState.done ||
                snap.connectionState == ConnectionState.active &&
                    snap.data != null) {
              //id = snap.data['uid'];
              //print('User Id Home : ${snap.data['uid']}');
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Home'.toUpperCase()),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('ID : ${snap.data['uid']}'),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      child: Text('Logout'),
                      onPressed: () {
                        _removeHiveDb();
                        //onLogout();
                      }),
                ],
              ));
            } else if (snap.data == null) {
              return LoginUi();
            } else {
              print('${snap.data} ${snap.connectionState}');
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 14),
                      Text('Loading ...'),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  onLogout() async {
    // dynamic fuser = await FirestoreDart.auth
    //     .signOut("${user.email}", "$_password")
    //     .catchError(
    //       (e) => showDialog(
    //         context: context,
    //         builder: (_) => AlertDialog(
    //           title: Text('Sign-Up Gagal'),
    //           content: Text('$e'),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text('OK'),
    //               onPressed: () => Navigator.pop(context),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
  }

  _removeHiveDb() {
    final _repo = Hivedb();
    // final model = {"uid": uid};
    // _repo.addHiveDb(model);
    _repo.itemHiveDb();
    // print('hell');
  }
}
