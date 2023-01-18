import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foods_test/app/data/models/food_model/food_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../network/rest_client.dart';

class ApiRepository {

  RestClient? _restClient;


  Future _init() async {
    final dio = Dio();
    dio.options = BaseOptions(validateStatus: (val) => true);
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 10000;
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: false,
          requestBody: true,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
    _restClient = RestClient(dio, baseUrl: '');
  }

  Future _base(
      Function function,
      ) async {
    try {
      await _init();
      return await function();
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception('Connection Problem! - timeout');
      } else if (ex.type == DioErrorType.receiveTimeout) {
        throw Exception('Could not get data! - timeout');
      }
      throw Exception(ex.message);
    }
  }

  Future<List<FoodModel>?> getFoods() async {
    return await _base(() async {
      var response = await _restClient?.getFood();
      return response;
    });
  }

}