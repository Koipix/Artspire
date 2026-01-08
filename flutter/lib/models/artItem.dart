class ArtItem {
  final int id;
  final String serviceName;
  final String description;
  final String details;
  final String artistName;
  final String imgUrl;
  final String pImgUrl;
  final String category;
  final String status;
  final String date;
  final bool isNewOffer;
  final double price;
  final double rating;
  final int rateAmount;

  ArtItem({
    required this.id,
    required this.serviceName,
    required this.description,
    required this.details,
    required this.artistName,
    required this.imgUrl,
    required this.pImgUrl, 
    required this.category,
    required this.status,
    required this.date,
    required this.isNewOffer,
    required this.price,
    required this.rating,
    required this.rateAmount,
  });

  factory ArtItem.fromJson(Map<String, dynamic> json) {
    return ArtItem(
      id: json["id"],
      serviceName: json["title"],
      description: json["description"],
      details: json["details"],
      artistName: json["artist"]["username"],
      imgUrl: json["image_url"],
      pImgUrl: json["artist"]["pfp_url"],
      category: json["category"],
      status: json["status"],
      date: json["created_at"],
      isNewOffer: json["is_new_offer"],
      price: json["price"],
      rating: json["avgRating"],
      rateAmount: json["ratingCount"]
    );
  }
}




