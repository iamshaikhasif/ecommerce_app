import 'package:ecommerce_app/constant/custom_data.dart';
import 'package:ecommerce_app/model/gadget_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel with ChangeNotifier {
  final List<GadgetDetail> _gadgetDetailList = [];
  List<GadgetDetail> get gadgetList => _gadgetDetailList;

  getGadgetList() async {
    await Future.delayed(const Duration(seconds: 3));
    _gadgetDetailList.addAll(gadgetStaticList);
    notifyListeners();
  }

}
