import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopCard extends StatelessWidget {
  const PopCard({
    super.key, 
    required this.imgPath, 
    required this.tagName, 
    required this.tagsDescription,
    required this.price
  });

  final String imgPath;
  final String tagName;
  final String price; 
  final String tagsDescription;

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
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tagName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  tagsDescription,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.2,
                    height: 1.5,
                    color: Colors.white,
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
