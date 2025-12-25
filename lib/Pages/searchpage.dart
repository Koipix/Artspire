import 'package:artspire/models/searcbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(),
        Searchbar(),
        CategoryTabs(),
      ], 
    );
  }
}

//Page Header
class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 25, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search",
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            "Discover the best art from our verified artist!",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ); 
  }
}

//CategoryTabs
class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  //mock data - delete later
  static const List<String> categoryTabs = ["All", "Recommendation", "Popular", "Hot Offer", "Rating"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 5),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryTabs.length, 
        itemBuilder: (BuildContext context, int index) {
          return Text(
            categoryTabs[index],
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: const Color(0xFFC5C2D2),
            ),
          );
        }, 
        separatorBuilder: (context, index) {
          return const SizedBox(width: 18);
        }
      ),
    );
  }
}
