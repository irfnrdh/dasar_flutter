import 'package:dasar_flutter/ui/hello_screen.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloScreen(),
    );
  }
}
