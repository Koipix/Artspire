import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/widgets/searcbar.dart';
import 'package:flutter_svg/svg.dart';

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
            style: GoogleFonts.poppins(
              fontSize: 20, 
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
          Searchbar(),
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
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 12),
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
              : BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF383843),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8)
              ),
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
        }
        ),
      ),
    );
  }
}

class ChatTree extends StatelessWidget {
  const ChatTree({super.key});

  static const List<Map<String, String>> chats = [
    {
      "name": "梅原生（せい）",
      "message": "Hii, thank you so much!🩵 Enjoy your holiday <<<<<))))",
      "image": "assets/img/Chatpf.png",
    },
    {
      "name": "梅原生（せい）",
      "message": "Hii, thank you so much!🩵 Enjoy your holiday <<<<<))))",
      "image": "assets/img/Chatpf.png",
    },
    {
      "name": "梅原生（せい）",
      "message": "Hii, thank you so much!🩵 Enjoy your holiday <<<<<))))",
      "image": "assets/img/Chatpf.png",
    },
    {
      "name": "梅原生（せい）",
      "message": "Hii, thank you so much!🩵 Enjoy your holiday <<<<<))))",
      "image": "assets/img/Chatpf.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 12),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(chat["image"]!),
                ),

                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat["name"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 14),

                      Text(
                        chat["message"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFC5C2D2),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 12)),
                SvgPicture.asset(
                  'assets/icons/menuchat.svg',
                  width: 45,
                  height: 45,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
