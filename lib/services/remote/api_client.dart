import 'package:dio/dio.dart';
import 'package:life_skills_app/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'auth_service.dart';

class ApiClient {
  final dio = Dio();
  AuthService auth;

  ApiClient() {
    dio.interceptors.add(
        PrettyDioLogger(responseBody: true, requestBody: true, request: true));

    auth = AuthService(dio, baseUrl: Constants.BASE_URL_API);
  }
}
