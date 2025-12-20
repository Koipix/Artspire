import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                return Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 150,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(pImgPath[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ), //Img 
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withValues(alpha: 140),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        tags[index],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Starting from",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          height: 1.7,
                          color: const Color(0xFFC5C2D2),
                        ),
                      ),
                      Text(
                        "${price[index]}+",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          height: 1.5,
                          color: Colors.white, 
                        ),
                      ),
                    ],
                  ),
                ); //Servies Card
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
