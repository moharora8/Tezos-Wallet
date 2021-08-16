import 'package:flutter/material.dart';

class AssetsView extends StatelessWidget {
  const AssetsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [for (int i = 0; i < 100; i++) Text('hello')],
      ),
    );
  }
}
