import 'package:flutter/material.dart';

import 'package:chat/src/pages/loading/widgets/term.dart';
import 'package:chat/src/pages/loading/widgets/form_login.dart';
import 'package:chat/src/pages/loading/widgets/labels.dart';
import 'package:chat/src/pages/loading/widgets/logo.dart';

class LoginPages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(image: 'assets/tag-logo.png', titulo: 'Login'),
                FormLogin(),
                Lables(title: 'Crear una ahora!',subtitle: '¿No tienes una cuenta?',ruta: 'register'),
                Term(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



