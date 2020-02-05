import 'package:dasar_flutter/config.dart';
import 'package:dasar_flutter/model/user.dart';
import 'package:dasar_flutter/praktek_login/home.dart';
import 'package:dasar_flutter/praktek_login/login_ui.dart';
import 'package:flutter/material.dart';

class SignupUi extends StatefulWidget {
  static String routeName = 'sign-up';
  @override
  _SignupUiState createState() => _SignupUiState();
}

class _SignupUiState extends State<SignupUi> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget space({double height, double width}) =>
      SizedBox(height: height, width: width);

  User user = User.empty();
  //String _displayName = '';
  String _password = '';
  //String _email = '';
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

    final nameTextField = TextFormField(
      initialValue: '',
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length < 3 ? 'Nama lengkap menimal 3 karekter' : null,
      onSaved: (val) => user.name = val,
      decoration: InputDecoration(
        hintText: 'Masukkan Nama Lengkap anda',
        labelText: 'Nama Lengkap',
      ),
    );

    final emailTextField = TextFormField(
      initialValue: '',
      keyboardType: TextInputType.emailAddress,
      validator: (val) => !val.contains('@') ? 'Email tidak valid' : null,
      onSaved: (val) => user.email = val,
      decoration: InputDecoration(
        hintText: 'Masukkan email anda',
        labelText: 'Email',
      ),
    );

    final passwordTextField = TextFormField(
      initialValue: '',
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length < 6 ? 'Password Minmal lebih dari 6 Karekter' : null,
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

    final loginButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).cardColor,
          child: Text('Daftar'.toUpperCase()),
          onPressed: () => onSigUp(),
        ),
        space(width: 30.0),
        RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).cardColor,
            child: Text('Masuk'.toUpperCase()),
            onPressed: () => Navigator.pushNamed(context, LoginUi.tag))
      ],
    );

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
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      dynamic fuser = await FirestoreDart.auth
          .signUp("${user.email}", "$_password")
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
      String uid = await fuser.id;
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
                .catchError((e) => print('Failed save data $e'));
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
