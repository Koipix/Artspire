import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageHeader(),
          SearchDM(),
          // ChatType(),
          // ChatTree()
        ],
      ),
    );
  }
}

class MessageHeader extends StatelessWidget {
  const MessageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 42),
      child: Center(
        child: Text(
          "Messages",
          style: GoogleFonts.poppins(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}

class SearchDM extends StatelessWidget {
  const SearchDM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 20, right: 20),
      child: SearchBar(
        leading: SvgPicture.asset(
          "assets/icons/Search.svg",
          height: 22,
          width: 22,
        ),
        hintText: "Search direct messages",
        hintStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFC5C2D2),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(const Color(0xFF383843)),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        ),
      ),
    );
  }
}
