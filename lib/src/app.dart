import 'package:flutter/material.dart';

import 'package:chat/src/routers/router.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
          primaryColor: Color(0xff1e81b0),
        accentColor: Color(0xffA9A9A9),
          ),
      routes: getAplicationPages(),
      initialRoute: 'login',
    );
  }
}
