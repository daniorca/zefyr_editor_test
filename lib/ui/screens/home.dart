import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Collections')),
      body: Center(
        child: FlatButton(
          child: Text('Create Card'),
          onPressed: () => navigator.pushNamed('/card'),
        ),
      ),
    );
  }
}