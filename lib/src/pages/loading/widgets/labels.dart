import 'package:flutter/material.dart';

class Lables extends StatelessWidget {
  final String title;
  final String subtitle;
  final String ruta;

  const Lables({
    Key key,
    @required this.ruta,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.subtitle,
              style: TextStyle(color: Theme.of(context).accentColor)),
          SizedBox(height: 10.0),
          GestureDetector(
            child: Text(
              this.title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 21),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}
