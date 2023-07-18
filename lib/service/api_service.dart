import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'models/account_entity.dart';
import 'models/analytic_entity.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'http://192.168.100.42:8888')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  static const Map<String, dynamic> header = { "Content-Type" : "application/json" };

  @GET("/getAccount")
  @Headers(header)
  Future<AccountEntity> getAccount();

  @GET("/getDepartments")
  @Headers(header)
  Future<List<AnalyticEntity>> getDepartments();

  @GET("/getPurposes")
  @Headers(header)
  Future<List<AnalyticEntity>> getPurposes();

  @GET("/getRepresentatives")
  @Headers(header)
  Future<List<AnalyticEntity>> getRepresentatives();
}