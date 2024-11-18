import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/auth_screen.dart';

import 'constants/material_white.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
      // home: HomePage(),
      theme: ThemeData(
        primarySwatch: white,
      ),
    );
  }
}
