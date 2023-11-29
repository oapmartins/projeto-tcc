import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/pages/home/diet/diet_controller.dart';
import 'package:projeto_tcc/pages/home/search_food/search_food_controller.dart';
import 'package:projeto_tcc/pages/home/search_food_similar_macro/search_food_similar_macro_controller.dart';
import 'package:projeto_tcc/pages/register/register_controller.dart';
import 'package:projeto_tcc/services/auth_service.dart';
import 'package:projeto_tcc/services/diet_service.dart';
import 'package:projeto_tcc/services/foods_service.dart';

Future<void> initServices() async {
  String basicAuth = 'Basic';

  Get.lazyPut(
    () => Dio(BaseOptions(headers: <String, String>{
      'authorization': basicAuth,
    })),
  );
  Get.put(FoodsService(Get.find()));
  Get.put(AuthService(Get.find()));
  Get.put(DietService(Get.find()));
  Get.put(DietController());
  Get.put(RegisterController());
  Get.put(SearchFoodController());
  Get.put(SearchFoodSimilarMacroController());
}
