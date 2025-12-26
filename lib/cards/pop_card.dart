import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopCard extends StatelessWidget {
  const PopCard({super.key, required this.imgPath, required this.tagName, required this.price});

  final String imgPath;
  final String tagName;
  final String price; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias, 
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imgPath, 
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 60),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tagName,
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "On everything today",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Starting from $price+",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    height: 3.3,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF7A88F2),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                  ),
                  child: const Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
