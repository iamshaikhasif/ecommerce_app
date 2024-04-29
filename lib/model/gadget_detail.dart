import 'package:ecommerce_app/constant/color.dart';
import 'package:flutter/material.dart';

class GadgetDetail {
  String? name;
  Color? color;
  Color? imageColor;
  String? image;
  String? price;

  GadgetDetail({this.name, this.color, this.price, this.image, this.imageColor = kLightBlue});
}
