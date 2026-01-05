class SearchItem {
  final String cardName;
  final String artistName;
  final String imgPath;
  final String pImgPath;
  final String tag;
  final bool isNewOffer;
  final double price;
  final double rating;
  final int rateAmount;

  SearchItem ({
    required this.cardName,
    required this.artistName,
    required this.imgPath,
    required this.pImgPath, 
    required this.tag,
    required this.isNewOffer,
    required this.price,
    required this.rating,
    required this.rateAmount,
  });
}
