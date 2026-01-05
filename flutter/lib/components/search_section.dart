import 'package:artspire/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:artspire/models/searchItem.dart';
import 'package:go_router/go_router.dart';

class SearchSection extends StatelessWidget {
  final List<SearchItem> items;

  SearchSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 520,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView.separated(
          itemCount: items.length, 
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => context.push("/search/${items[index].id}"),
              child: SearchCard(item: items[index]),
            ); 
          }, 
          separatorBuilder: (context, index) {
            return const SizedBox(height: 15);
          }
        ),
      ),
    );
  }
}
