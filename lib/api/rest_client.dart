

import 'package:digi_shop_app/model/base_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'rest_client.g.dart';
@RestApi(baseUrl: 'https://androidsupport.ir/pack/digiAndroid/')
abstract class RestClient{


  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('home.php')
  Future<BaseModel> home();

  @FormUrlEncoded()
  @POST('login.php')
  Future<HttpResponse> loginUser(@Field("username") String username,
      @Field("password") String password);



}