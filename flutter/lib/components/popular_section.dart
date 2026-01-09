import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/widgets/pop_card.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  //mock data declaration for layout testing
  static const List<String> tags = [
    "Made for creators",
    "No Generative AI",
    "Verified but private",
  ];
  static const List<String> tagsDescription = [
    "Anything you need for vtubing / streaming, music, games and content adventures - fans are welcome too!",
    "This space prioritizes human creativity and authorship. Generative AI content is not allowed.",
    "Verified artists, commisions and reviews but your info stays strictly between you and us!",
  ];
  static const List<String> price = ["₱3,000", "₱2,000", "₱5,000"];
  static const List<String> pImgPath = [
    "assets/img/n.png",
    "assets/img/manga.png",
    "assets/img/l3d.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (BuildContext context, int index) {
                return PopCard(
                  imgPath: pImgPath[index],
                  tagName: tags[index],
                  tagsDescription: tagsDescription[index],
                  price: price[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 18);
              },
            ),
          ),
        ],
      ),
    );
  }
}
