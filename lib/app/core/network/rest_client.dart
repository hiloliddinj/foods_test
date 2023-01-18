import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foods_test/app/aspect/constants/url_const.dart';
import 'package:retrofit/retrofit.dart';
import 'package:foods_test/app/data/models/food_model/food_model.dart';


part 'rest_client.g.dart';

@RestApi(baseUrl: UrlConst.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {@required String baseUrl}) = _RestClient;

  @GET(UrlConst.getFood)
  Future<List<FoodModel>> getFood();
}