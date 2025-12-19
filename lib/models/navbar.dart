import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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
    );
  }
}
