import 'package:flutter/material.dart';
import 'package:artspire/models/searcbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212e),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader(),
          Searchbar(),
        ],
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60, left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "For the love of",
            style: GoogleFonts.poppins(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1.2,
              color: Colors.white,
            ),
          ),
          Text(
            "human creativity",
            style: GoogleFonts.poppins(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1.2,
              color: const Color(0xFF7A88F2),
            ),
          ),
        ],
      )
    );
  }
}
