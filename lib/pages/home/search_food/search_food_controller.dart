import 'dart:convert';

import 'package:get/get.dart';
import 'package:projeto_tcc/services/foods_service.dart';

class SearchFoodController extends GetxController {
  SearchFoodController() {
    searchAllFoods();
  }

  final foodService = Get.find<FoodsService>();
  bool loading = false;

  Future<List> searchAllFoods() async {
    var listFoods = [];
    loading = true;
    await foodService.getAllFoods().then((value) {
      listFoods = jsonDecode(value);
    }).catchError((error) {
      print(error);
      loading = false;
    });
    loading = false;
    return listFoods;
  }
}
