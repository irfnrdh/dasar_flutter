import 'package:dasar_flutter/config.dart';
import 'package:dasar_flutter/model/user.dart';
import 'package:dasar_flutter/latihan_auth/home.dart';
import 'package:dasar_flutter/latihan_auth/signup_ui.dart';
import 'package:flutter/material.dart';
import 'package:firedart/auth/user_gateway.dart' as fuser;

import '../hive_db.dart';

class LoginUi extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User user = User.empty();
  String _password = '';
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/favicon.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (val) =>
          val.length < 3 ? 'Nama lengkap menimal 3 karekter' : null,
      // Menyimpan value ke model user.nama
      onSaved: (val) => user.email = val,
      // initialValue: 'studio@irfnrdh.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
        autofocus: false,
        // initialValue: 'Katasandi',
        obscureText: true,
        validator: (val) => val.length < 3 ? 'Tidak boleh kosong' : null,
        onSaved: (val) => _password = val,
        decoration: InputDecoration(
            hintText: 'katasandi',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => onLogin(),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => Navigator.pushNamed(context, SignupUi.routeName),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Sign-Up', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Lupa Katasandi?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel,
              signupButton
            ],
          ),
        ),
      ),
    );
  }

  onLogin() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      fuser.User userLogin = await FirestoreDart.auth
          .signIn("${user?.email ?? ''}", "${_password ?? ''}")
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
      String uid = userLogin.id;

      if (uid != null) {
        _addHiveDb(uid, user.email, _password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Home(),
          ),
        );
      }

      // print('firebase-user $fuser nama :$user  password : $_password');
    }
  }

  _addHiveDb(
    String uid,
    String email,
    String pass,
  ) {
    final _repo = Hivedb();
    final model = {"uid": uid, "email": email, "pass": pass};
    _repo.addHiveDb(model);
  }
}
