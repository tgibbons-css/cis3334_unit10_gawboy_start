import 'dart:convert';

import 'package:flutter/services.dart';

import 'painting_info.dart';

class LoadPaintingInfo {
  List<PaintingInfo> paintings = [];

  Future<List<PaintingInfo>> InitWithJson() async {
    final String response =  await rootBundle.loadString('text/image_list2.json');

    final List<dynamic> data = await json.decode(response);
    paintings = [];
    for (dynamic it in data) {
      final PaintingInfo item = PaintingInfo.fromJson(it);    // Parse data for one DataItem
      paintings.add(item);                                // add item to items List
    }
    return paintings;
  }

  List<PaintingInfo> getPaintingList() {
    InitWithJson().then((value) => paintings=value);
    return paintings;
  }


}
