import 'package:dasar_flutter/praktek/dashboard_ui.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    //LoginUi.tag: (context) => LoginUi(),
    //HelloScreen.tag: (context) => HelloScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tes Kepribadian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardUi(),
      routes: routes,
    );
  }
}
