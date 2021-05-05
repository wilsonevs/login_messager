import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/src/services/auth_services.dart';

import 'package:chat/src/pages/loading/widgets/boton_azul.dart';
import 'package:chat/src/pages/loading/widgets/custom_input.dart';

class FormLogin extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          CustomInput(
            placeholder: 'Correo',
            icon: Icons.mail_outline,
            textController: _emailcontroller,
            isPassword: false,
            keyBoardType: TextInputType.emailAddress,
          ),
          CustomInput(
            placeholder: 'Contraseña',
            icon: Icons.lock_outlined,
            textController: _passcontroller,
            keyBoardType: TextInputType.text,
            isPassword: true,
          ),
          BotonAzul(
              title: 'Ingresar',
              onPressd: () {
                print(_emailcontroller.text);
                print(_passcontroller.text);
                final authService= Provider.of<AuthServices>(context, listen: false);
                authService.login(_emailcontroller.text, _passcontroller.text);
              }),
        ],
      ),
    );
  }
}

