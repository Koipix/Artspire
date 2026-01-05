import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCardDetails extends StatelessWidget {
  final String id;

  const SearchCardDetails({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        title: CardHeader(id: id),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final String id;

  const CardHeader({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Card #${id}",
        style: GoogleFonts.poppins(
          fontSize: 28, 
          color: Colors.black
        ),
      ),
    );
  }
}
