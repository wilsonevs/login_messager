import 'package:flutter/material.dart';

import 'package:chat/src/pages/loading/View/login_page.dart';
import 'package:chat/src/pages/loading/View/register_page.dart';
import 'package:chat/src/pages/usuarios/View/usuario_page.dart';
import 'package:chat/src/pages/chats/View/chat_page.dart';


Map<String, WidgetBuilder> getAplicationPages() {
  return<String, WidgetBuilder>{
  'login'   :  (_) => LoginPages(),
  'register':  (_) => RegisterPages(),
  'usuario' :  (_) => UsuarioPages(),
  'chat'    :  (_) => ChatPage(),
  };
}
