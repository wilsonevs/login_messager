import 'package:flutter/material.dart';

class ChatMesagge extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMesagge({
    Key key,
    @required this.texto,
    @required this.uid,
    @required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.ease),
        child: Container(
          child: this.uid == '125' ? _myMesagge(context) : _noMyMesagge(),
        ),
      ),
    );
  }

  _myMesagge(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(bottom: 5, right: 10, left: 50),
          child: Text(this.texto, style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  _noMyMesagge() {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(bottom: 5, left: 10, right: 50),
          child: Text(this.texto, style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              color: Color(0xFF696969),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
