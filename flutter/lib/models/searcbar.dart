import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, right: 20, left: 20),
      child: SearchBar(
        leading: SvgPicture.asset(
          "assets/icons/Search.svg",
          height: 22,
          width: 22,
        ), 
        hintText: "Search", 
        hintStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFC5C2D2),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xFF383843)),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(vertical: 5, horizontal: 20))
      ),
    );
  }
}
