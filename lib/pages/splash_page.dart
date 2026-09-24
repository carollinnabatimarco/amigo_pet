import 'dart:async';

import 'package:flutter/material.dart';

import '../style/app_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          '/',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.verdeEscuro,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ==================================================
            // LOGO
            // ==================================================

            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x30000000),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),

              child: Image.asset(
                'assets/logo_pet.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // NOME
            // ==================================================

            const Text(
              'AmigoPet',

              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Cuidados que aproximam',

              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 45),

            // ==================================================
            // CARREGAMENTO
            // ==================================================

            const SizedBox(
              width: 28,
              height: 28,

              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor:
                AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}