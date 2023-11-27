import 'package:dio/dio.dart';
import 'package:projeto_tcc/config/config_url.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('${ConfigURL.API}/set_user')
  Future setUser(@Query('user_id') String id, @Body() Map<String, dynamic> map);
}
