import 'package:flutter/material.dart';
// import './rank_double.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './flower_famous.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget',
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}