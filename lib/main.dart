import 'package:dasar_flutter/ui/material/tooltip_ui.dart';
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
      home: TooltipUi(),
    );
  }
}
