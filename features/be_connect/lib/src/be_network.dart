import 'package:dio/dio.dart';

final _dio = Dio();

class BeNetwork {
  const BeNetwork();

  Future<Response> getHttp(String url) async {
    final response = await _dio.get(url);

    return response;
  }

  Future<Response> getPost(String url, dynamic body) async {
    final response = await _dio.post(url, data: body);

    return response;
  }
}
