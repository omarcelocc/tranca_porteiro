import 'package:dio/dio.dart';

import 'http_client_interface.dart';

class DioClient implements IHttpClient {
  final Dio _dio = new Dio();
  @override
  Future<dynamic> put(String url, dynamic data, String token) async {
    print(data);
    print(token);

    _dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await _dio.post(
      url,
      data: data,
    );
    print('body: ${response.data}');
    print(response.statusCode);
    if (response.statusCode == 201) {
      print('linkou usuario');
      return true;
    } else {
      print(response.extra);
      print(response.headers);
      return false;
    }
  }

  @override
  Future<dynamic> get(String url, String token) async {
    print(token);
    print(url);
    try {
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      final response = await _dio.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('pegou os dados');
        print('body: ${response.data}');
        return response.data;
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      print("erro no DIo");
      print(e);
      return ('sem conexão');
    }
  }
}
