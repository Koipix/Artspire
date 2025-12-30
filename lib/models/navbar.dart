import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  static const _routes = [
    '/home',
    '/search',
    '/add',
    '/notification',
    '/profile',
  ];

  int _locationIndex(String location) {
    final index = _routes.indexWhere((r) => location.startsWith(r));
    return index < 0 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF383843), width: 2)),
      ),
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: const Color(0xFF21212e),
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        height: 70,
        selectedIndex: _locationIndex(location),
        onDestinationSelected: (index) {
          context.go(_routes[index]);
        },
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/Home.svg",
              height: 20,
              width: 20,
            ),
            selectedIcon: SvgPicture.asset(
              "assets/icons/Home_Highlight.svg",
              height: 55,
              width: 55,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/Compass.svg",
              height: 25,
              width: 25,
            ),
            selectedIcon: SvgPicture.asset(
              "assets/icons/Compass_Highlight.svg",
              height: 55,
              width: 55,
            ),
            label: "Explore",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/Add.svg",
              height: 50,
              width: 50,
            ),
            label: "Create",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/Message.svg",
              height: 25,
              width: 25,
            ),
            selectedIcon: SvgPicture.asset(
              "assets/icons/Message_Highlight.svg",
              height: 55,
              width: 55,
            ),
            label: "Message",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/User.svg",
              height: 25,
              width: 25,
            ),
            selectedIcon: SvgPicture.asset(
              "assets/icons/User_Hightlight.svg",
              height: 55,
              width: 55,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
