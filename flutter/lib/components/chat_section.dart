import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/models/chatItem.dart';

class ChatTree extends StatelessWidget {
  final List<ChatItem> chats;

  const ChatTree({super.key, required this.chats});

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
                  backgroundImage: AssetImage(chats[index].imgPath),
                ),

                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chats[index].username,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 14),

                      Text(
                        chats[index].latestMsg,
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
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
