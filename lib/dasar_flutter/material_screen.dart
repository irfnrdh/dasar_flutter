import 'package:flutter/material.dart';

class MaterialScreen extends StatefulWidget {
  MaterialScreen({Key key}) : super(key: key);

  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    // Membuat Appbar
    var _appBar = AppBar(
      //leading: Icon(Icons.menu),
      title: Text('Material Design'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );

    // Membuat font heading
    //var display1 = Theme.of(context).textTheme.display1;

    // Isi Konten
    var _body = Column(
      children: <Widget>[
        Text(
          'Belajar Flutter',
          //style: display1,
        ),
        SizedBox(height: 16.0),
        Text(
            'Belajar flutter emang seru banget, apalagi jika bisa membuat aplikasi yang bermanfaat untuk banyak orang. Bukan hanya sedekar aplikasi tapi aplikasi gratis dan pastinya banyak fiturnya untuk mereka yang membutuhkan.')
      ],
    );

    // Membuat icon floating
    var _fab = FloatingActionButton(
      child: Icon(Icons.add),
      tooltip: 'Tambahkan Saya!',
      onPressed: () {},
    );

    // Membuat icon navigasi
    var _bnv = BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.hotel),
          title: Text('Hotel'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          title: Text('Segarkan'),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.face), title: Text('Flutter'))
      ],
    );

    // membuat header drawer
    var _drawerHeader = DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.blue[100]]),
        ),
        child: Column(
          children: <Widget>[
            Text('Material Design'),
            Text('Material Design with Flutter')
          ],
        ));

    // membuat drawer
    var _drawer = Drawer(
      child: ListView(
        children: <Widget>[
          _drawerHeader,
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          ListTile(title: Text('Tutorial'), leading: Icon(Icons.filter)),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.face),
            onTap: () {},
          ),
        ],
      ),
    );

    // run
    return new Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _body,
      ),
      floatingActionButton: _fab,
      bottomNavigationBar: _bnv,
      drawer: _drawer,
    );
  }
}
