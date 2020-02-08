import 'package:dasar_flutter/config.dart';
import 'package:dasar_flutter/model/user.dart';
import 'package:dasar_flutter/latihan_auth/home.dart';
import 'package:dasar_flutter/latihan_auth/login_ui.dart';
import 'package:flutter/material.dart';

class SignupUi extends StatefulWidget {
  // Menambahkan nama route
  static String routeName = 'sign-up';

  @override
  _SignupUiState createState() => _SignupUiState();
}

class _SignupUiState extends State<SignupUi> {
  // Menambahkan Key Untuk Form
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Membuat Widget Untuk Spasi
  Widget space({double height, double width}) =>
      SizedBox(height: height, width: width);

  // Menginisialisasi Model User Kosong
  User user = User.empty();

  //String _displayName = '';
  String _password = '';
  //String _email = '';
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    // Tampilan Logo
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/favicon.png'),
      ),
    );

    // Inputan Nama
    final nameTextField = TextFormField(
      initialValue: '',
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length < 3 ? 'Nama lengkap menimal 3 karekter' : null,
      // Menyimpan value ke model user.nama
      onSaved: (val) => user.name = val,
      decoration: InputDecoration(
        hintText: 'Masukkan Nama Lengkap anda',
        labelText: 'Nama Lengkap',
      ),
    );

    //Inputan Email
    final emailTextField = TextFormField(
      initialValue: '',
      keyboardType: TextInputType.emailAddress,
      validator: (val) => !val.contains('@') ? 'Email tidak valid' : null,
      // Menyimpan value ke model user.email
      onSaved: (val) => user.email = val,
      decoration: InputDecoration(
        hintText: 'Masukkan email anda',
        labelText: 'Email',
      ),
    );

    //Inputan Password
    final passwordTextField = TextFormField(
      initialValue: '',
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length < 6 ? 'Password Minmal lebih dari 6 Karekter' : null,
      // menyimpan value ke variabel password
      onSaved: (val) => _password = val,
      obscureText: _showPassword,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Masukkan passwor anda',
        labelText: 'Password',
        suffix: IconButton(
          icon: Icon(_showPassword ? Icons.lock : Icons.lock_open),
          onPressed: _showPassword
              ? () => setState(() => _showPassword = false)
              : () => setState(() => _showPassword = true),
        ),
      ),
    );

    //Tombol Button Login
    final loginButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).cardColor,
          child: Text('Daftar'.toUpperCase()),
          // Mengarahkan ke fungsi signup
          onPressed: () => onSigUp(),
        ),
        space(width: 30.0),
        RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).cardColor,
            child: Text('Masuk'.toUpperCase()),
            // Mengarahkan ke halaman login
            onPressed: () => Navigator.pushNamed(context, LoginUi.tag))
      ],
    );

    // Tampilan Utama Dasar
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              logo,
              Column(
                children: <Widget>[Text('Hello'), Text('Helo')],
              ),
              space(height: 14),
              nameTextField,
              space(height: 14),
              emailTextField,
              space(height: 14),
              passwordTextField,
              space(height: 24),
              loginButton,
              //registerField()
            ],
          ),
        ),
      ),
    );
  }

  onSigUp() async {
    // mendapatkan key form
    final form = _formKey.currentState;
    // mengecek validasi form
    if (form.validate()) {
      form.save();
      // Koneksi & signup ke Firedart
      dynamic fuser = await FirestoreDart.auth
          .signUp("${user.email}", "$_password")
          // Menampilkan Pesan Error
          .catchError(
            (e) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Sign-Up Gagal'),
                content: Text('$e'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );

      //print('fuser-${(await fuser.id)} uid:${await fuser.runtimeType}');

      // Menyimpan User id login ke variabel UID
      String uid = await fuser.id;

      // Mengecek apakah UID sudah ada di Database Firebase
      if (uid != null || uid.isNotEmpty) {
        user.uid = uid;
        Future.delayed(Duration(seconds: 2), () async {
          //print('login kembali  ${user.email} $_password');
          final document = FirestoreDart.userRef.document(uid);
          if ((await document.exists)) {
            document.update(user.toJson());
          } else {
            final docId = await document
                .create(user.toJson())
                .catchError((e) => print('F\ailed save data $e'));
            print('doct $docId');
            if (docId != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Home(),
                ),
              );
            }
          }
        });
      }
      // print('firebase-user $fuser nama :$user  password : $_password');
    }
  }
}
