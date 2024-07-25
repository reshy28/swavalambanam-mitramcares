import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rest_api/model/newspapper_info_model.dart';

class NewspapperController with ChangeNotifier {
  List<NewspaperModel> newspaperDatas = [];
  bool isLoading = false;

  Future getDatas() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://chroniclingamerica.loc.gov/search/titles/results/?terms=oakland&format=json&page=1");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        // decode
        final decodedRes = jsonDecode(res.body) as Map<String, dynamic>;
        log(decodedRes.toString());

        // Assuming the list you need is under a key, for example, 'items'
        final items = decodedRes['items'] as List;

        newspaperDatas =
            items.map((element) => NewspaperModel.fromJson(element)).toList();

        log(newspaperDatas.first.toString());
      } else {
        log("failed");
      }
    } catch (e) {
      log(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}
