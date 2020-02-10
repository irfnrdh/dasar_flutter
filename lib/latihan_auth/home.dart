import 'package:flutter/material.dart';
import '../hive_db.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _repo = Hivedb();

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder(
          future: _repo.itemHiveDb(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Center(
                child: Text('Hello'),
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
