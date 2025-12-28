import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/models/searcbar.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [MessageHeader(), ChatType(), ChatTree()],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Messages",
            style: GoogleFonts.poppins(fontSize: 28, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Searchbar(),
          ),
        ],
      ),
    );
  }
}

class ChatType extends StatelessWidget {
  const ChatType({super.key});

  static const List<String> msgcategs = ["All", "My Requests"];
  static const int selectedcateg = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: Row(
        children: List.generate(msgcategs.length, (index) {
          final isSelected = index == selectedcateg;

          return Padding(
            padding: EdgeInsets.only(
              right: index == msgcategs.length - 1 ? 0 : 10,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
              decoration: isSelected
                  ? BoxDecoration(
                      color: const Color(0xFF7A88F2),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Text(
                msgcategs[index],
                style: GoogleFonts.poppins(
                  fontSize: isSelected ? 14 : 13,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  color: isSelected ? Colors.white : const Color(0xFFC5C2D2),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ChatTree extends StatelessWidget {
  const ChatTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
