import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF21212E),
        elevation: 0,
        leadingWidth: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/icons/path.svg'),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 34),
          ProfileEdit(name: "梅原生（せい）", avatarPath: "assets/img/Chatpf.png"),
          SizedBox(height: 48),

          ProfileMenus(
            iconPath: 'assets/icons/PersonInfo.svg',
            title: 'Personal Information',
            arrow: 'assets/icons/arrowright.svg',
          ),
          ProfileMenus(
            iconPath: 'assets/icons/Imgicon.svg',
            title: "Artworks",
            arrow: 'assets/icons/arrowright.svg',
          ),
          ProfileMenus(
            iconPath: 'assets/icons/settings.svg',
            title: 'Settings',
            arrow: 'assets/icons/arrowright.svg',
          ),
          const SizedBox(height: 180),
          LogoutAcc(),
        ],
      ),
    );
  }
}

class ProfileEdit extends StatelessWidget {
  final String name;
  final String avatarPath;

  const ProfileEdit({super.key, required this.name, required this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 65, backgroundImage: AssetImage(avatarPath)),
          const SizedBox(height: 12),
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenus extends StatelessWidget {
  final String iconPath;
  final String title;
  final String arrow;

  const ProfileMenus({
    super.key,
    required this.iconPath,
    required this.title,
    required this.arrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 22, height: 22),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFFC5C2D2),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SvgPicture.asset(arrow, width: 18, height: 18),
        ],
      ),
    );
  }
}

class LogoutAcc extends StatelessWidget {
  const LogoutAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFF343552),
        border: Border.all(color: const Color(0xFFFF3636), width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/door.svg', width: 20, height: 20),
          const SizedBox(width: 10),

          Text(
            'Logout Account',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFFF3636),
            ),
          ),
        ],
      ),
    );
  }
}
