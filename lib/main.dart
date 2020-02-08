import 'package:dasar_flutter/latihan_auth/login_ui.dart';
import 'package:dasar_flutter/latihan_auth/signup_ui.dart';
import 'package:flutter/material.dart';
import 'package:dasar_flutter/hive_db.dart';

import 'latihan_auth/home.dart';

void main() async {
  // Mengatasi Permasalahan Error Baru
  WidgetsFlutterBinding.ensureInitialized();

  // Memanggil Koneksi Hive DB Ketika Apliasi Berjalan
  await Hivedb.hvConnect;
  runApp(MyApp());
}

//await Hivedb.hvConnect();

class MyApp extends StatelessWidget {
  // Route perpindahan halaman
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
      // Menghilangkan Bacaan Debug di Aplikasi
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Memeriksa apakah sudah pernah login atau belum
      home: FutureBuilder(
          //Sumber data
          future: _repo.itemHiveDb(),
          //Mengecek Koneksi
          builder: (BuildContext context, AsyncSnapshot snap) {
            // if (snap.hasData == null) {
            //   return LoginUi();
            // } else {
            //   return Home();
            // }

            if (snap.connectionState == ConnectionState.active &&
                snap.data != null) {
              // Todo : Mengecek UID sudah terdaftar atau belum
              //print('User Id Main : ${snap.data['uid']}');
              return Home();
            } else if (snap.hasData == null) {
              // Jika data histori login pada hive db tidak ditemukan
              return LoginUi();
            } else {
              // Jika tidak ada koneksi menampilkan loading
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

      // Route ke halaman lain
      routes: routes,
    );
  }
}
