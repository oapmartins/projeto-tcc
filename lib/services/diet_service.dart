import 'package:dio/dio.dart';
import 'package:projeto_tcc/config/config_url.dart';
import 'package:retrofit/http.dart';

part 'diet_service.g.dart';

@RestApi()
abstract class DietService {
  factory DietService(Dio dio, {String baseUrl}) = _DietService;

  @GET('${ConfigURL.API}/get_user_diet')
  Future getUserDiet(@Query('user_id') String id);
}
