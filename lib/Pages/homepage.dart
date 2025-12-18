import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212e),
      body: Text(
        "For the love of human creativity",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 80,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          height: 1.2,
          color: Colors.white,
        ),
      ),
    );
  }
}
