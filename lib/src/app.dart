import 'package:chat/src/services/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:chat/src/routers/router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData(
          primaryColor: Color(0xff1e81b0),
          accentColor: Color(0xffA9A9A9),
        ),
        routes: getAplicationPages(),
        initialRoute: 'login',
      ),
    );
  }
}
