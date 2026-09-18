import 'package:flutter/material.dart';

import 'cores.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MarcenariaApp());
}

class MarcenariaApp extends StatelessWidget {
  const MarcenariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcenaria — Projetos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: marrom,
        scaffoldBackgroundColor: const Color(0xFFFDFBF8),
      ),
      home: const HomePage(),
    );
  }
}
