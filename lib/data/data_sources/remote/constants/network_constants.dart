import 'package:mobx_example/core/dio/configs/dio_configs.dart';

class NetworkConstants {
  NetworkConstants._();

  // URLs:----------------------------------------------------------------------
  static const String baseUrlDev = 'https://dev-abc.com/';
  static const String baseUrlQa = 'https://qa-abccom/';
  static const String baseUrlProd = 'https://abc.com/';

  // timeouts:------------------------------------------------------------------
  static const int receiveTimeout = kDefaultReceiveTimeout;
  static const int connectionTimeout = kDefaultConnectionTimeout;
  static const int cacheTimeOut = kDefaultCacheTimeOutInMinutes;

  // urls
  static const String url1 = "https://abc.com/param";
}
