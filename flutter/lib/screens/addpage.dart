import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: SizedBox(
          height: 58,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7A88F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // handle upload
            },
            child: Text(
              "Upload",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Makes the page scrollable when vertical space is constrained (small screens or keyboard open)
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddHeader(),

              const ArtInfo(label: "Minimum Price", value: "₱5,000"),
              const SizedBox(height: 6),
              const ArtInfo(label: "Maximum Price", value: "₱10,000"),
              const SizedBox(height: 6),
              const Category(),
              const SizedBox(height: 6),
              const DescriptionBox(),
              const SizedBox(height: 12),
              const UploadImage(),
              // No Spacer here — the button is pinned via bottomNavigationBar
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class AddHeader extends StatelessWidget {
  const AddHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 42, bottom: 40),
      child: Center(
        child: Text(
          "Upload Commission",
          style: GoogleFonts.poppins(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}

class ArtInfo extends StatelessWidget {
  final String label;
  final String value;

  const ArtInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF383843),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFC5C2D2),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String selected = "Select Category";

  final List<String> categories = ["Illustration", "Animation", "Emotes"];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final chosen = await showModalBottomSheet<String>(
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xFF21212E),
              child: ListView(
                children: categories.map((c) {
                  return ListTile(
                    title: Text(
                      c,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    onTap: () => Navigator.pop(context, c),
                  );
                }).toList(),
              ),
            );
          },
        );
        if (chosen != null) {
          setState(() => selected = chosen);
        }
      },
      child: Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF383843),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFC5C2D2),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  selected,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/icons/arrowdown.svg",
              width: 10,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 164,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF383843),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFC5C2D2),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TextField(
              maxLines: null,
              expands: true,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Write Something..",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [10, 8],
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      color: const Color(0xFF7A88F2),
      strokeWidth: 1,
      child: Container(
        width: double.infinity,
        height: 159,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/upload.svg",
              width: 172,
              height: 115,
            ),
            const SizedBox(height: 6),
            Text(
              "Upload an Image",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xFF7A88F2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
