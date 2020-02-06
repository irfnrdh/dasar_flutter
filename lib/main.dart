import 'package:dasar_flutter/praktek_login/login_ui.dart';
import 'package:dasar_flutter/praktek_login/signup_ui.dart';
import 'package:flutter/material.dart';
import 'package:dasar_flutter/hive_db.dart';

import 'praktek_login/home.dart';

// import 'package:flutter/';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hivedb.hvConnect;
  runApp(MyApp());
}

//await Hivedb.hvConnect();

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginUi.tag: (context) => LoginUi(),
    SignupUi.routeName: (context) => SignupUi(),
    //HelloScreen.tag: (context) => HelloScreen()
  };

  @override
  Widget build(BuildContext context) {
    final _repo = Hivedb();
    return MaterialApp(
      title: 'Belajar Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _repo.itemHiveDb(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.connectionState == ConnectionState.done ||
                snap.connectionState == ConnectionState.active &&
                    snap.data != null) {
              print('sdasadsa sada ${snap.data['uid']}');
              return Home();
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
      routes: routes,
    );
  }
}
