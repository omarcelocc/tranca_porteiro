import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http_client_interface.dart';

class DioClient implements IHttpClient {
  final _dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token;
    if (sp.getString('token') == null) {
      token = '';
    } else {
      token = sp.getString('token')!;
    }

    _dio.options.headers["Authorization"] = "Bearer $token";
    try {
      final response = await _dio.get(url);
      print(response.data);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('erro get dados login:');
      print(e);
      return 'error';
    }
  }

  @override
  Future<bool> post(String url, dynamic data) async {
    print(data);
    final response = await _dio.postUri(
      Uri.parse(url),
      data: data,
    );
    print(response.data);
    if (response.statusCode == 201) {
      return true;
    } else {
      print(response.extra);
      print(response.headers);
      return false;
    }
  }

  @override
  Future<dynamic> postAuth(String url, dynamic data) async {
    print('data _dio');
    print(data);

    final response = await _dio.post(
      url,
      data: data,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.data;
    } else {
      print(response.extra);
      print("headers");
      print(response.headers);
      return '';
    }
  }

  @override
  Future<dynamic> postToken(String url, dynamic data, String token) async {
    print(data);
    print(token);
    Dio __dio = new Dio();
    __dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await __dio.post(
      url,
      data: data,
    );
    print('body: ${response.data}');
    print(response.statusCode);
    if (response.statusCode == 201) {
      print('linkou usuario');
      return true;
    } else {
      print('nao linkou usuario');

      return false;
    }
  }
}
