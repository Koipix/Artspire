import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.artistName,
    required this.serviceName,
    required this.price,
    required this.isNewOffer,
    required this.imgPath
  });

  final String artistName;
  final String serviceName;
  final String price;
  final String imgPath;
  final bool isNewOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF343552),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 252,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover
              ), 
            ),
            margin: EdgeInsets.only(bottom: 10),
            height: 165,
          ), //Image Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      height: 2.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF7A88F2),
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), 
                ),
                child: Text(
                  "Purchase",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
