import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/cards/service_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  //mock data declaration for layout testing
  static const List<String> tags = ["Live2D Model", "Special Portraits", "Headshots"];
  static const List<String> price = ["₱3,000", "₱2,000", "₱5,000"];
  static const List<String> pImgPath = ["assets/img/l2d.png", "assets/img/portrait.png", "assets/img/head.png"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  height: 1.2,
                  color: Colors.white,
                ),
              ),
              Text(
                "View All",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  height: 1.2,
                  color: const Color(0xFF7A88F2),
                ),
              ),
            ], 
          ), //Services Heading
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length, 
              itemBuilder: (BuildContext context, int index) {
                return ServiceCard(
                  imgPath: pImgPath[index], 
                  tagName: tags[index],
                  price: price[index]
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 18);
              }
            ),
          ),
        ],
      ),
    );
  }
}
