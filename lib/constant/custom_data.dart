import 'package:ecommerce_app/constant/color.dart';
import 'package:ecommerce_app/constant/image.dart';
import 'package:ecommerce_app/model/gadget_detail.dart';

List<GadgetDetail> cartList = [
  GadgetDetail(name: 'Smart watch', price: '120.00', color: kLightGreen, image: 'assets/images/watch-black.png'),
  GadgetDetail(name: 'Air pods', price: '150.00', color: kLightOrange, image: 'assets/images/airpods.png'),
  GadgetDetail(name: 'Earphone', price: '60.00', color: kOrange, image: 'assets/images/earphone.png'),
];

List<GadgetDetail> gadgetList = [
  GadgetDetail(name: 'smart watch', price: '100.00', color: kLightOrange, image: ImageResource.watchBlack),
  GadgetDetail(name: 'headphone', price: '77.00', color: kOrange, image: ImageResource.headphoneRed1),
  GadgetDetail(name: 'apple watch', price: '67.99', color: kLightBlue, image: ImageResource.appleWatch),
  GadgetDetail(name: 'earphone', price: '45.50', color: kLightGreen, image: ImageResource.earphone),
  GadgetDetail(name: 'airpods', price: '60.00', color: kLightOrange, image: ImageResource.airpods),
];