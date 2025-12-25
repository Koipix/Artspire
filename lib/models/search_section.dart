import 'package:artspire/cards/search_card.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        itemCount: 3, //hardcoded data, change later
        itemBuilder: (BuildContext context, int index) {
          return SearchCard(
            artistName:"梅原生（せい）", 
            serviceName: 'Full Illustration', 
            price: "₱2,055.90", 
            imgPath: "assets/img/sei.png",
            isNewOffer: true, 
          );
        }, 
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        }
      ),
    );  
  }
}
