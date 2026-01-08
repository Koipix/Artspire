import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:artspire/models/artItem.dart';
import 'package:artspire/apiService.dart';

class SearchCardDetails extends StatelessWidget {
  final ArtItem item;

  SearchCardDetails({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/XButton.svg"
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ) 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderImage(
            item: item,
          ),
          HeaderDetails(
            item: item,
          ),
          CardDescription(
            item: item,
          ),
          Spacer(),
          BuySection(
            item: item,
          ),
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  final ArtItem item;

  const HeaderImage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: item?.imgUrl.isNotEmpty ?? false
            ? DecorationImage(
              image: NetworkImage(item!.imgUrl),
              fit: BoxFit.cover
            ) : null, 
          ), 
        ),
      ),
    ); 
  }
}

class HeaderDetails extends StatelessWidget {
  final ArtItem item;

  const HeaderDetails({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.serviceName ?? 'Item not found',
                  style: GoogleFonts.poppins(
                    fontSize: 22, 
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: (item?.pImgUrl != null && item!.pImgUrl.isNotEmpty)
                      ? NetworkImage(item!.pImgUrl)
                      : null,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      item!.artistName,
                      style: GoogleFonts.poppins(
                        fontSize: 14, 
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFC5C2D2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/icons/HeartReact.svg",
            height: 50,
            width: 50,
          ),
        ],
      ) 
    );
  }
}

class CardDescription extends StatelessWidget {
  final ArtItem item;

  const CardDescription ({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Description",
              style: GoogleFonts.poppins(
                fontSize: 22, 
                fontWeight: FontWeight.w500,
                color: const Color(0xFFC5C2D2),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              item?.description ?? 'No description provided',
              style: GoogleFonts.poppins(
                fontSize: 15, 
                fontWeight: FontWeight.w300,
                color: const Color(0xFFC5C2D2),
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}

class BuySection extends StatelessWidget {
  final ArtItem item;

  const BuySection({
    super.key,
    required this.item,
  });

  static final _formatter = NumberFormat.currency(
    locale: 'en_PH',
    symbol: '₱',
    decimalDigits: 2
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "Minimum Price",
                  style: GoogleFonts.poppins(
                    fontSize: 16, 
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _formatter.format(item!.price),
                  style: GoogleFonts.poppins(
                    fontSize: 22, 
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF7A88F2),
                  ),
                ),
              ], 
            ), 
          ),
          GestureDetector(
            onTap: () => context.push(
              "/search/${item?.id}/details",
              extra: item
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF7A88F2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Buy now",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}
