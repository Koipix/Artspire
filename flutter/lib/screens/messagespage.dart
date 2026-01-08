import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:artspire/widgets/searcbar.dart';
import 'package:artspire/models/chatItem.dart';
import 'package:artspire/components/chat_section.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagesPage> {
  int selectedIndex = 0;
  void _updateCategory(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //mock data
  final List<ChatItem> chats = [
    ChatItem(
      username: "梅原生（せい）",
      latestMsg: "Hii, thank you so much!🩵 Enjoy your holiday <<<<<))))",
      imgPath: "assets/img/Chatpf.png",
      isRequested: false,
    ),
    ChatItem(
      username: "さえ[saemidesu]",
      latestMsg: "Appreciate your request, I'll try my best working on this!",
      imgPath: "assets/img/saemi.png",
      isRequested: false,
    ),
    ChatItem(
      username: "somna",
      latestMsg: "Can you make this animation? Thank you",
      imgPath: "assets/img/somna.png",
      isRequested: true,
    ),
  ];

  List<ChatItem> filteredItems() {
    if (selectedIndex == 0)
      return chats;
    else
      return chats.where((e) => e.isRequested).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageHeader(),
          ChatType(selectedIndex: selectedIndex, onSelected: _updateCategory),
          ChatTree(chats: filteredItems()),
        ],
      ),
    );
  }
}

class ChatType extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onSelected;

  const ChatType({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<ChatType> createState() => _ChatTypeState();
}

class _ChatTypeState extends State<ChatType> {
  static const List<String> msgcategs = ["All", "My Requests"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 12),
      child: Row(
        children: List.generate(msgcategs.length, (index) {
          final isSelected = index == widget.selectedIndex;

          return Padding(
            padding: EdgeInsets.only(
              right: index == msgcategs.length - 1 ? 0 : 10,
            ),
            child: GestureDetector(
              onTap: () => widget.onSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 3,
                ),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                child: Text(
                  msgcategs[index],
                  style: GoogleFonts.poppins(
                    fontSize: isSelected ? 14 : 13,
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : FontWeight.normal,
                    color: isSelected ? Colors.white : const Color(0xFFC5C2D2),
                  ),
                ),
              ),
            ),
          );
        }),
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
              color: Colors.white,
            ),
          ),
          Searchbar(hintMsg: "Search direct messages"),
        ],
      ),
    );
  }
}
