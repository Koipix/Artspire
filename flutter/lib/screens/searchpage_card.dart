import 'package:flutter/material.dart';
import 'package:artspire/models/searchItem.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/data_rep.dart';
import 'package:artspire/models/searchItem.dart';

class SearchCardDetails extends StatelessWidget {
  final int id;

  SearchCardDetails({
    super.key,
    required this.id,
  });

  List<SearchItem> items = DataRep.searchItems; 
  
  SearchItem? getItem() {
    return items.firstWhere((e) => e.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        title: CardHeader(
          item: getItem(),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final SearchItem? item;

  const CardHeader({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        item?.cardName ?? 'Item not found',
        style: GoogleFonts.poppins(
          fontSize: 28, 
          color: Colors.black
        ),
      ),
    );
  }
}
