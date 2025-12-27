import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF21212E),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
      ),
      body: const Center(
        child: Text(
          'Your messages will appear here',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
