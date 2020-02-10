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
            if (!snap.hasData &&
                    snap.connectionState == ConnectionState.active ||
                snap.connectionState == ConnectionState.done) {
              var auth = snap.data;
              //_repo.deleteHiveDb('h0tsYp99O3SAtXKa6amoQwQF5hp1');
              if (auth != null) {
                print('User Id Main : ${auth['uid']}');
                if (auth['uid'] != null) return Home();
              } else {
                return LoginUi();
              }
            }

            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 14),
                    Text('Menunggu Proses Selesai ...'),
                  ],
                ),
              ),
            );
          }),

      // Route ke halaman lain
      routes: routes,
    );
  }
}
