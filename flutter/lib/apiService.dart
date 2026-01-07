import 'package:artspire/models/artItem.dart';

class DataRep {
  //mock data for testing
  static final List<ArtItem> artItems = [
    ArtItem(
      id: 1,
      serviceName: 'Full Illustration', 
      description: "",
      artistName:"梅原生（せい）", 
      imgPath: "assets/img/sei.png",
      pImgPath: "assets/img/Chatpf.png",
      category: "Illustration",
      details: "",
      isNewOffer: true, 
      price: 3500, 
      rating: 5.0,
      rateAmount: 109,
    ),
  ];
}
