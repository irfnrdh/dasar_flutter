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
            if (snap.connectionState == ConnectionState.active) {
              // Todo : Mengecek UID sudah terdaftar atau belum
              print('User Id Main : ${snap.data['uid']}');
              if (snap.connectionState == ConnectionState.done) {
                if (snap.data != null) {
                  return Home();
                } else {
                  return LoginUi();
                }
              } else {
                // Jika tidak ada koneksi menampilkan loading
                print(
                    'eror broh, Snap data : ${snap.data} Snapkoneksi :  ${snap.connectionState}');
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
              }
            } else {
              if (snap.data != null) {
                return Home();
              }
              print('User Id Main : ${snap.data['uid']}');
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 14),
                      Text('Menunggu Koneksi Aktif...'),
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
