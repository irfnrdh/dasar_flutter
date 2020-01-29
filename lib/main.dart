import 'package:dasar_flutter/ui/material_screen.dart';
import 'package:flutter/material.dart';
import 'ui/material_screen.dart';
// import 'package:flutter/';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialScreen(),
    );
  }
}
