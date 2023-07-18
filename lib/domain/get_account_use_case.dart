import 'dart:convert';

import 'package:alfa_mobile/service/models/account_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../service/api_service.dart';

class GetAccountUseCase {
  Future<AccountEntity> getAccount() {
    final dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        if (response.requestOptions.method == HttpMethod.GET) {
          response.data = jsonDecode(response.data as String);
        }
        return handler.next(response);
      },
    ));
    final client = ApiService(dio);
    return client.getAccount();
  }
}