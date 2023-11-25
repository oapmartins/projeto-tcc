import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/search_food/search_food_controller.dart';
import 'package:projeto_tcc/services/foods_service.dart';

Future<void> initServices() async {
  String basicAuth = 'Basic';

  Get.lazyPut(
    () => Dio(BaseOptions(headers: <String, String>{
      'authorization': basicAuth,
    })),
  );
  Get.put(FoodsService(Get.find()));
  Get.put(SearchFoodController());
}