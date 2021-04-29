import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String title;
  final VoidCallback onPressd;

  const BotonAzul({
    Key key,
    @required this.onPressd,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Container(
          width: double.infinity,
          height: 45,
          child: Center(
            child: Text(
              this.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          onPrimary: Color(0xfffafafa),
          elevation: 2.5,
          shape: StadiumBorder(),
        ),
        onPressed: this.onPressd,
      ),
    );
  }
}
