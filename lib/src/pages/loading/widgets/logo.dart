import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final String image;
  final String titulo;

  const Logo({Key key, this.image, this.titulo}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(widget.image)),
          SizedBox(
            height: 20.0,
          ),
          Text(
            widget.titulo.toUpperCase(),
            style: TextStyle(fontSize: 30.0),
          )
        ],
      ),
    );
  }
}
