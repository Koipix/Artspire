import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProfileHeader(),
          // UserProfile(),
          // UserDetails(),
          // ArtType(),
          // Arts()
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 42),
      child: Center(
        child: Text(
          "Profile",
          style: GoogleFonts.poppins(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}
