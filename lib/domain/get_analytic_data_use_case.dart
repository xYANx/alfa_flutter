import 'dart:convert';

import 'package:alfa_mobile/service/models/analytic_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../service/api_service.dart';

class GetAnalyticDataUseCase {
  final dio = Dio();
  ApiService? client;

  initClient() {
    if(client == null) {
      dio.interceptors.add(InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.requestOptions.method == HttpMethod.GET) {
            response.data = jsonDecode(response.data as String);
          }
          return handler.next(response);
        },
      ));
      client = ApiService(dio);
    }
  }

  Future<List<AnalyticEntity>> getPurposes() {
    initClient();
    return client?.getPurposes() ?? Future.value(List.empty());
  }

  Future<List<AnalyticEntity>> getDepartments() {
    initClient();
    return client?.getDepartments() ?? Future.value(List.empty());
  }

  Future<List<AnalyticEntity>> getRepresentatives() {
    initClient();
    return client?.getRepresentatives() ?? Future.value(List.empty());
  }
}