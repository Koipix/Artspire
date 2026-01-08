import 'package:flutter/material.dart';
import 'package:artspire/widgets/searcbar.dart';
import 'package:artspire/components/popular_section.dart';
import 'package:artspire/components/service_section.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader(),
          Searchbar(hintMsg: "Search"),
          PopularSection(),
          ServiceSection(),
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
      margin: EdgeInsets.only(top: 60, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "For the love of",
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1.2,
              color: Colors.white,
            ),
          ),
          Text(
            "human creativity",
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1.2,
              color: const Color(0xFF7A88F2),
            ),
          ),
        ],
      ),
    );
  }
}
