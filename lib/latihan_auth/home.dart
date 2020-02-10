import 'package:flutter/material.dart';
import '../hive_db.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _repo = Hivedb();

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder(
          future: _repo.itemHiveDb(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Center(
                child: Text('Hello'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
