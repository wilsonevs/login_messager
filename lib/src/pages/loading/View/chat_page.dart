import 'package:chat/src/pages/loading/widgets/chat_mesagge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final String _title = 'Wilson Valencia';
  final _mesaggeController = TextEditingController();
  final _focusNode = FocusNode();
  bool _estadoEscribiendo = false;

  List<ChatMesagge> _mesagge = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                child: Text(this._title.substring(0, 1),
                    style: TextStyle(fontSize: 12)),
                backgroundColor: Theme.of(context).primaryColor,
                maxRadius: 14),
            SizedBox(
              height: 3.0,
            ),
            Text(_title,
                style: TextStyle(fontSize: 12, color: Color(0xFF000000))),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _mesagge.length,
                  itemBuilder: (_, i) => _mesagge[i],
                  reverse: true),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              height: 50,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(color: Colors.black87, fontSize: 16),
                controller: _mesaggeController,
                autocorrect: true,
                autofocus: false,
                onSubmitted: _handleSubmit,
                onChanged: (String v) {
                  // TODO: Manejar el estado del icono
                  setState(() {
                    if (v.trim().length > 0) {
                      _estadoEscribiendo = true;
                    } else {
                      _estadoEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje...',
                ),
                focusNode: _focusNode,
              ),
            ),
            // Boton de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: null,
                      onPressed: _estadoEscribiendo
                          ? () => _handleSubmit(_mesaggeController.text.trim())
                          : null,
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(
                            color: Theme.of(context).primaryColor),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.send),
                          onPressed: _estadoEscribiendo
                              ? () =>
                                  _handleSubmit(_mesaggeController.text.trim())
                              : null,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {

    if(texto.length == 0) return;
    print(texto);
    // Limpia el texto.
    _mesaggeController.clear();
    // Mantiene el focus
    _focusNode.requestFocus();

    final newMesagge = ChatMesagge(
      uid: '123',
      texto: texto,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    );
    _mesagge.insert(0, newMesagge);
    newMesagge.animationController.forward();

    setState(() {
      _estadoEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMesagge mesagge in _mesagge){
      mesagge.animationController.dispose();
    }
    super.dispose();
  }
}
