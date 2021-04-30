import 'package:flutter/material.dart';

import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/src/pages/loading/models/usuario.dart';

class UsuarioPages extends StatefulWidget {
  @override
  _UsuarioPagesState createState() => _UsuarioPagesState();
}

class _UsuarioPagesState extends State<UsuarioPages> {
  final String titlename = 'Mi nombre';

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  final usuarios = [
    Usuario(
        uid: '1',
        nombre: 'Wilson Valencia',
        email: 'wilson_evs@gmail.com',
        online: true),
    Usuario(
        uid: '2',
        nombre: 'Liz Alegre',
        email: 'jess.91@gmail.com',
        online: false),
    Usuario(
        uid: '3',
        nombre: 'Johana Valencia',
        email: 'joha_29198@gmail.com',
        online: true),
    Usuario(
        uid: '6',
        nombre: 'Johana Valencia',
        email: 'joha_29198@gmail.com',
        online: true),
    Usuario(
        uid: '5',
        nombre: 'Liz Alegre',
        email: 'jess.91@gmail.com',
        online: false),
    Usuario(
        uid: '4',
        nombre: 'Wilson Valencia',
        email: 'wilson_evs@gmail.com',
        online: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(this.titlename.toUpperCase(),
            style: TextStyle(color: Theme.of(context).primaryColor)),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black54),
          onPressed: null,
        ),
        actions: <Widget>[
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle,
                  //Icon(Icons.offline_bolt, color: Colors.red),
                  color: Theme.of(context).primaryColor)),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () => _cargarUsuario(),
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Theme.of(context).primaryColor),
          waterDropColor: Theme.of(context).primaryColor,
        ),
        child: _listViewUsuario(),
      ),
    );
  }

  ListView _listViewUsuario() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTitle(usuarios[i]),
      separatorBuilder: (_, i) => Divider(height: 1.5, color: Colors.black45),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTitle(Usuario user) {
    final double size = 10;
    return ListTile(
      title: Text(user.nombre),
      leading: CircleAvatar(
        child: Text(user.nombre.substring(0, 3)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      trailing: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: user.online == true ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _cargarUsuario() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
  //
}
