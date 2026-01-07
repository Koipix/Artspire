class ArtItem {
  final int id;
  final String serviceName;
  final String description;
  final String artistName;
  final String imgPath;
  final String pImgPath;
  final String category;
  final String details;
  final bool isNewOffer;
  final double price;
  final double rating;
  final int rateAmount;

  ArtItem({
    required this.id,
    required this.serviceName,
    required this.description,
    required this.artistName,
    required this.price,
    required this.imgPath,
    required this.pImgPath, 
    required this.category,
    required this.details,
    required this.isNewOffer,
    required this.rating,
    required this.rateAmount,
  });
}
