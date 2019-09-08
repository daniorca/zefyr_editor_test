import 'package:flutter/material.dart';
import 'package:valise_zefyr/ui/screens/card_editor.dart';
import 'package:valise_zefyr/ui/screens/home.dart';

void main() => runApp(ValiseZefyrApp());

class ValiseZefyrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey.shade800),
      debugShowCheckedModeBanner: false,
      title: 'Valise Zefyr Editor',
      home: HomePage(),
      routes: {
        '/card': (context) => CardEditor(),
      },
    );
  }
}



