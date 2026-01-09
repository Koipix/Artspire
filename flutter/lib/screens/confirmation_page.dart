import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import "package:flutter_stripe/flutter_stripe.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:artspire/models/artItem.dart';
import 'package:artspire/apiService.dart';

class PurchaseConfirmation extends StatefulWidget {
  PurchaseConfirmation({super.key, required this.id, required this.item});

  final int id;
  final ArtItem item;

  @override
  State<PurchaseConfirmation> createState() => _PurchaseConfirmationState();
}

class _PurchaseConfirmationState extends State<PurchaseConfirmation> {
  late double _totalPrice;
  late final double _originalBasePrice;
  bool isTermsAccepted = false;

  @override
  void initState() {
    super.initState();
    _originalBasePrice = widget.item.price;
    _totalPrice = _originalBasePrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/XButton.svg"),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PriceDetails(
              serviceName: widget.item.serviceName,
              price: _totalPrice,
            ),
            HeaderImage(imgUrl: widget.item.imgUrl),
            BuyingOptions(
              basePrice: _originalBasePrice,
              onPriceChange: (newPrice) {
                setState(() => _totalPrice = newPrice);
              },
              monetizationRate: widget.item.monetizationRate,
              commercialRate: widget.item.commercialRate,
            ),
            PaymentMethods(),
            ArtDetails(item: widget.item),
            TermsOfService(item: widget.item),
            AcceptSection(
              artistName: widget.item.artistName,
              isTermsAccepted: isTermsAccepted,
              onAccepted: (val) {
                setState(() {
                  isTermsAccepted = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  final String serviceName;
  final double price;

  const PriceDetails({
    super.key,
    required this.serviceName,
    required this.price,
  });

  static final _formatter = NumberFormat.currency(
    locale: 'en_PH',
    symbol: '₱',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceName,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
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
                _formatter.format(price),
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
  final String imgUrl;

  const HeaderImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: imgUrl.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class BuyingOptions extends StatefulWidget {
  const BuyingOptions({
    super.key,
    required this.basePrice,
    required this.onPriceChange,
    required this.monetizationRate,
    required this.commercialRate,
  });

  final double basePrice;
  final double monetizationRate;
  final double commercialRate;
  final void Function(double newPrice) onPriceChange;

  State<BuyingOptions> createState() => _BuyingOptionsState();
}

class _BuyingOptionsState extends State<BuyingOptions> {
  bool _monetized = false;
  bool _commercialized = false;

  void _updatePrice() {
    double price = widget.basePrice;

    if (_monetized) {
      price *= widget.monetizationRate;
    }

    if (_commercialized) {
      price *= widget.commercialRate;
    }

    widget.onPriceChange(price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
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
                  GestureDetector(
                    onTap: () {
                      setState(() => _monetized = !_monetized);
                      _updatePrice();
                    },
                    child: SvgPicture.asset(
                      _monetized
                          ? "assets/icons/Checked.svg"
                          : "assets/icons/Unchecked.svg",
                      height: 25,
                      width: 25,
                    ),
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
                "+${(widget.monetizationRate - 1) * 100}%",
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
                  GestureDetector(
                    onTap: () {
                      setState(() => _commercialized = !_commercialized);
                      _updatePrice();
                    },
                    child: SvgPicture.asset(
                      _commercialized
                          ? "assets/icons/Checked.svg"
                          : "assets/icons/Unchecked.svg",
                      height: 25,
                      width: 25,
                    ),
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
                "+${((widget.commercialRate - 1) * 100).toStringAsFixed(0)}%",
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
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF383843), width: 2),
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

class ArtDetails extends StatelessWidget {
  final ArtItem item;

  const ArtDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF383843), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            "Details",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            item!.details,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: const Color(0xFF828282),
            ),
          ),
        ],
      ),
    );
  }
}

class TermsOfService extends StatelessWidget {
  final ArtItem item;

  const TermsOfService({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF383843), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            "${item.artistName}'s Terms of Service",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            item!.customToS, //change later
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: const Color(0xFFC5C2D2),
            ),
          ),
        ],
      ),
    );
  }
}

class AcceptSection extends StatefulWidget {
  const AcceptSection({
    super.key,
    required this.artistName,
    required this.isTermsAccepted,
    required this.onAccepted,
  });

  final String artistName;
  final bool isTermsAccepted;
  final void Function(bool) onAccepted;

  State<AcceptSection> createState() => _AcceptSectionState();
}

class _AcceptSectionState extends State<AcceptSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        spacing: 15,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => widget.onAccepted(!widget.isTermsAccepted),
                child: SvgPicture.asset(
                  widget.isTermsAccepted
                      ? "assets/icons/Checked.svg"
                      : "assets/icons/Unchecked.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              SizedBox(width: 15),
              Text(
                "I accept ${widget.artistName}'s Terms of Service",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.push('/payment');
                  },  
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: 
                      widget.isTermsAccepted
                      ? const Color(0xFF7A88F2)
                      : const Color(0xFF383843),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        widget.isTermsAccepted
                        ? "Submit request"
                        : "Accept terms to submit a request",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/icons/MessageBackdrop.svg",
                height: 40,
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
