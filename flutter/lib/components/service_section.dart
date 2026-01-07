import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/widgets/service_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  //mock data declaration for layout testing
  static const List<String> tags = ["Live2D Model", "Special Portraits", "Headshots"];
  static const List<String> price = ["₱3,000", "₱2,000", "₱5,000"];
  static const List<String> pImgPath = ["assets/img/l2d.png", "assets/img/portrait.png", "assets/img/head.png"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Commisions",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              ),
            ], 
          ), //Services Heading
          Container(
            margin: EdgeInsets.only(top: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: tags.length, 
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ServiceCard(
                  imgPath: pImgPath[index], 
                  tagName: tags[index],
                  price: price[index]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
