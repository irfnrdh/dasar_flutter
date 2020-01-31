import 'package:flutter/material.dart';

class TooltipUi extends StatelessWidget {
  var text = Text('Ini adalah tulisan');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              text,

              // Tooltip(
              //   message: Text("Ini adalah isi tooltip"),
              //   child: IconButton(
              //     color: Color(Colors.red),
              //     onPressed: () {},
              //     icon: Icon(Icons.search),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
