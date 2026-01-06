import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artspire/models/searchItem.dart';
import 'package:artspire/data_rep.dart';

class PurchaseConfirmation extends StatelessWidget {
  final int id;

  PurchaseConfirmation({
    super.key,
    required this.id,
  });

  final List<SearchItem> items = DataRep.searchItems; 
  
  SearchItem? getItem() {
    return items.firstWhere((e) => e.id == id);
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PriceDetails(
              item: getItem(),
            ),
            HeaderImage(
              item: getItem(),
            ),
            BuyingOptions(),
            PaymentMethods(),
          ],
        ),
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  final SearchItem? item;

  const PriceDetails({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item?.cardName ?? 'Item not found',
            style: GoogleFonts.poppins(
              fontSize: 24, 
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          ),
          Row(
            children: [
              Text(
                "Starting from ",
                style: GoogleFonts.poppins(
                  fontSize: 20, 
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFC5C2D2),
                ),
              ),
              Text(
                "₱${item!.price.toString()}",
                style: GoogleFonts.poppins(
                  fontSize: 20, 
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF7A88F2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  final SearchItem? item;

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
            image: item?.imgPath.isNotEmpty ?? false
            ? DecorationImage(
              image: AssetImage(item!.imgPath),
              fit: BoxFit.cover
            ) : null, 
          ), 
        ),
      ),
    ); 
  }
}

class BuyingOptions extends StatefulWidget {
  const BuyingOptions({super.key});

  State<BuyingOptions> createState() => _BuyingOptionsState();
}

class _BuyingOptionsState extends State<BuyingOptions> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Checked.svg",
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Personal",
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "Included",
                style: GoogleFonts.poppins(
                  fontSize: 16, 
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFC5C2D2),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Unchecked.svg",
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Monetized",
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "+50%",
                style: GoogleFonts.poppins(
                  fontSize: 16, 
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFC5C2D2),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Unchecked.svg",
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Commercial",
                    style: GoogleFonts.poppins(
                      fontSize: 16, 
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "+100%",
                style: GoogleFonts.poppins(
                  fontSize: 16, 
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFC5C2D2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF383843),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            "Payment Methods",
            style: GoogleFonts.poppins(
              fontSize: 20, 
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(
                "assets/icons/paypal-line.svg",
                height: 25,
                width: 25,
              ),
              SvgPicture.asset(
                "assets/icons/mastercard-line.svg",
                height: 25,
                width: 25,
              ),
              SvgPicture.asset(
                "assets/icons/visa-line.svg",
                height: 25,
                width: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
