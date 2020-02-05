import 'package:dasar_flutter/dasar_flutter/componen/alert.dart';
import 'package:dasar_flutter/praktek_login/login_ui.dart';
import 'package:dasar_flutter/praktek_login/signup_ui.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginUi.tag: (context) => LoginUi(),
    SignupUi.routeName: (context) => SignupUi(),
    //HelloScreen.tag: (context) => HelloScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Alert(),
      routes: routes,
    );
  }
}
