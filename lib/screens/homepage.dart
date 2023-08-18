import 'package:flutter/material.dart';

import '../widgets/weatherwidhet.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: [weatherwidget()],
        ),
      ),
    ));
  }
}
