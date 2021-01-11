import 'package:alergo/core/text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Alergo'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'a sample text',
            style: headline3(context),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () => {},
      ),
    );
  }
}
