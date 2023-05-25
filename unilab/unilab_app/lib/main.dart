
import 'package:flutter/material.dart';
import 'package:unilab_app/pages/login.dart';
import 'package:unilab_app/pages/cadastroPage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}