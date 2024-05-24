import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_list/theme/theme.dart';
import 'package:recipe_list/theme/theme_provider.dart';
import 'package:recipe_list/views/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child:  const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const MyHomePage(),
    );
  }
}
