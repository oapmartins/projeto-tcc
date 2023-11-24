import 'package:dio/dio.dart';
import 'package:projeto_tcc/config/config_url.dart';
import 'package:retrofit/http.dart';

part 'foods_service.g.dart';

@RestApi()
abstract class FoodsService {
  factory FoodsService(Dio dio, {String baseUrl}) = _FoodsService;

  @GET('${ConfigURL.API}/get_all_foods')
  Future getAllFoods();
}
