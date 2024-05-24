import 'package:flutter/material.dart';
import 'package:recipe_list/theme/theme.dart';
import 'package:recipe_list/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      home: const MyHomePage(),
    );
  }
}
