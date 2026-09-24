import 'package:flutter/material.dart';

import 'pages/inicio_page.dart';

void main() {
  runApp(const AmigoPetApp());
}


class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AmigoPet',

      theme: ThemeData(
        useMaterial3: true,

        fontFamily: 'Arial',

        scaffoldBackgroundColor:
        const Color(0xFFF8F6F0),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF24513A),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor:
          Color(0xFF24513A),

          foregroundColor: Colors.white,

          elevation: 0,
        ),
      ),

      home: const InicioPage(),
    );
  }
}