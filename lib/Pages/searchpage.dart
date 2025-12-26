import 'package:artspire/models/searcbar.dart';
import 'package:artspire/models/search_section.dart';
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
        SearchSection(),
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
      margin: EdgeInsets.only(top: 30, left: 25),
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
  
  //mock data, change later
  static const List<String> categoryTabs = ["All", "Recommendation", "Popular", "Hot Offer", "Rating"];
  static const int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categoryTabs.length, (index) {
            final isSelected = index == selectedIndex;
            return Container(
              padding: EdgeInsets.only(right: index == categoryTabs.length - 1 ? 0 : 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: isSelected
                ? BoxDecoration(
                  color: const Color(0xFF7A88F2),
                  borderRadius: BorderRadius.circular(6),
                ) : null,
                child: Text(
                  categoryTabs[index],
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
      ),
    );
  }
}

//ListView ver.
// class CategoryTabs extends StatelessWidget {
//   const CategoryTabs({super.key});
//
//   //mock data - delete later
//   static const List<String> categoryTabs = ["All", "Recommendation", "Popular", "Hot Offer", "Rating"];
//   static const int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 10),
//       height: 20,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: categoryTabs.length, 
//         itemBuilder: (BuildContext context, int index) {
//           return index == selectedIndex ? 
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF7A88F2),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: Text(
//                 categoryTabs[index],
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white, 
//                 ),
//               )
//             ) :
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//               child: Text(
//                 categoryTabs[index],
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: const Color(0xFFC5C2D2), 
//                 ),
//               )
//             );
//         }, 
//         separatorBuilder: (context, index) {
//           return const SizedBox(width: 10);
//         }
//       ),
//     );
//   }
// }
