import 'package:flutter/material.dart';
import 'package:heythereproject/pages/change_color_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Change',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChangeColorPage(),
    );
  }
}
