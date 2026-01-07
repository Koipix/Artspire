import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/widgets/searcbar.dart';
import 'package:artspire/components/search_section.dart';
import 'package:artspire/apiService.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  // List<SearchItem> items = DataRep.searchItems;

  //filter logic
  List<SearchItem> filteredItems() {
    if (selectedIndex == 0) return items;
    const categoryTabs = ["Illustration", "Animation", "Emotes", "Rating"];
    return items.where((e) => e.tag == categoryTabs[selectedIndex - 1]).toList();
  }

  int selectedIndex = 0;
  void _updateCategory(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(),
        Searchbar(
          hintMsg: "Search"
        ),
        CategoryTab(
          selectedIndex: selectedIndex,
          onSelected: _updateCategory,
        ),
        SearchSection(
          items: filteredItems(),
        ),
      ], 
    );
  }
}

class CategoryTab extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onSelected;

  const CategoryTab({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

//_CategoryTabState
class _CategoryTabState extends State<CategoryTab> {
  
  //mock data, change later
  static const List<String> categoryTabs = ["All", "Illustration", "Animation", "Emotes", "Rating"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categoryTabs.length, (index) {
            final isSelected = index == widget.selectedIndex;
            return Container(
              padding: EdgeInsets.only(right: index == categoryTabs.length - 1 ? 0 : 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: isSelected
                ? BoxDecoration(
                  color: const Color(0xFF7A88F2),
                  borderRadius: BorderRadius.circular(6),
                ) : null,
                child: GestureDetector(
                  onTap: () => widget.onSelected(index),
                  child: Text(
                    categoryTabs[index],
                    style: GoogleFonts.poppins(
                      fontSize: isSelected ? 14 : 13,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                      color: isSelected ? Colors.white : const Color(0xFFC5C2D2),
                    ),
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
