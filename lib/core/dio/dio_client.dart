import 'package:dio/dio.dart';

import 'configs/dio_configs.dart';

class DioClient {
  final DioConfigs dioConfigs;
  final Dio dio;

  DioClient({required this.dio, required this.dioConfigs});

  factory DioClient.basic({required DioConfigs dioConfigs}) => DioClient(
      dio: Dio()
        ..options.baseUrl = dioConfigs.baseUrl
        ..options.connectTimeout =
            Duration(milliseconds: dioConfigs.connectionTimeout)
        ..options.receiveTimeout =
            Duration(milliseconds: dioConfigs.receiveTimeout),
      dioConfigs: dioConfigs);

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return dio..interceptors.addAll(interceptors);
  }
}
