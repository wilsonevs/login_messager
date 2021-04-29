import 'package:flutter/material.dart';
import 'package:chat/src/pages/loading/widgets/boton_azul.dart';
import 'package:chat/src/pages/loading/widgets/custom_input.dart';

class FormRegister extends StatelessWidget {
  final _usercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          CustomInput(
            placeholder: 'Usuario',
            icon: Icons.person_outline,
            textController: _usercontroller,
            isPassword: false,
            keyBoardType: TextInputType.text,
          ),
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
            isPassword: true,
            keyBoardType: TextInputType.text,
          ),
          BotonAzul(
              title: 'Ingresar',
              onPressd: () {
                print(_emailcontroller.text);
                print(_passcontroller.text);
              }),
        ],
      ),
    );
  }
}
