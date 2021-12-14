import 'package:arquitetura/app/interfaces/client_http_services_interfice.dart';
import 'package:dio/dio.dart';

class ClientHttpServices implements IclientHttp {
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    var response = await dio.get(url);

    return response.data;
  }
}
