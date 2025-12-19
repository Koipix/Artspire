import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/models/searcbar.dart';
import 'package:artspire/models/popular_section.dart';
import 'package:artspire/models/service_section.dart';

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
          PopularSection(),
          ServiceSection(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFF383843),
              width: 2,
            )
          )
        ),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/icons/Home_Highlight.svg",
                height: 55,
                width: 55,
              ), 
              label: "uwu",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/icons/Compass.svg",
                height: 25,
                width: 25,
              ), 
              label: "uwu",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/icons/Add.svg",
                height: 50,
                width: 50,
              ), 
              label: "uwu",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/icons/Bell.svg",
                height: 25,
                width: 25,
              ), 
              label: "uwu",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/icons/User.svg",
                height: 25,
                width: 25,
              ), 
              label: "uwu",
            ),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: const Color(0xFF21212e),
          indicatorColor: Colors.transparent,
          height: 70,
        )
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
      )
    );
  }
}
