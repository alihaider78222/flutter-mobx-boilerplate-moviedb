const kDefaultReceiveTimeout = 10000;
const kDefaultConnectionTimeout = 10000;

const kDefaultCacheTimeOutInMinutes = 5;

class DioConfigs {
  final String baseUrl;
  final int receiveTimeout;
  final int connectionTimeout;

  const DioConfigs({
    required this.baseUrl,
    this.receiveTimeout = kDefaultReceiveTimeout,
    this.connectionTimeout = kDefaultConnectionTimeout,
  });
}
