import 'package:artspire/models/searchItem.dart';

class DataRep {
  //mock data for testing
  static final List<SearchItem> searchItems = [
    SearchItem(
      id: 1,
      cardName: 'Full Illustration', 
      artistName:"梅原生（せい）", 
      imgPath: "assets/img/sei.png",
      pImgPath: "assets/img/Chatpf.png",
      tag: "Illustration",
      description: "I provide anime-style illustration commission services, delivering high-quality, original artwork tailored to each client’s vision. My work focuses on character illustrations, crafted with care, attention to detail, and a genuine love for storytelling through art.",
      isNewOffer: true, 
      price: 3500, 
      rating: 5.0,
      rateAmount: 109,
    ),
    SearchItem(
      id: 2,
      cardName: 'Animated Cover', 
      artistName:"potatoimoetz", 
      imgPath: "",
      pImgPath: "assets/img/saemi.png",
      tag: "Animation",
      description: "I provide anime-style illustration commission services, delivering high-quality, original artwork tailored to each client’s vision. My work focuses on character illustrations, crafted with care, attention to detail, and a genuine love for storytelling through art.",
      isNewOffer: true, 
      price: 7000, 
      rating: 4.6,
      rateAmount: 41,
    ),
    SearchItem(
      id: 3,
      cardName: 'Stickers Pack', 
      artistName:"88 Studio",
      imgPath: "",
      pImgPath: "assets/img/somna.png",
      tag: "Emotes",
      description: "I provide anime-style illustration commission services, delivering high-quality, original artwork tailored to each client’s vision. My work focuses on character illustrations, crafted with care, attention to detail, and a genuine love for storytelling through art.",
      isNewOffer: true, 
      price: 1999, 
      rating: 4.9,
      rateAmount: 65,
    ),
  ];
}
