import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, right: 25, left: 25),
      child: SearchBar(
        leading: SvgPicture.asset(
          "assets/icons/Search.svg",
          height: 32,
          width: 32,
        ), 
        hintText: "Search", 
        hintStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: const Color(0xFFC5C2D2),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xFF383843)),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(vertical: 10, horizontal: 33))
      ),
    );
  }
}
