// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http_client_interface.dart';

class DioClient implements IHttpClient {
  final Dio _dio = new Dio();
  @override
  Future<dynamic> post(String url, dynamic data) async {
    print(data);
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String token = sp.getString('token')!;
      //print(token);

      _dio.options.headers["Authorization"] = "Bearer $token";
      final response = await _dio.post(
        url,
        data: data,
      );
      print('body: ${response.data}');
      print(response.statusCode);
      if (response.statusCode == 201) {
        print('criou o convite');
        print(response.data);
        return true;
      } else {
        print(response.extra);
        print(response.headers);
        return false;
      }
    } catch (e) {
      print('erro dio');
      print(e);
      return 'erro';
    }
  }

  @override
  Future<dynamic> get(String url) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString('token')!;
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
      return ('error');
    }
  }

  @override
  Future<dynamic> delete(String url) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString('token')!;
    print(url);
    try {
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      final response = await _dio.delete(url);

      print(response.statusCode);
      if (response.statusCode == 204) {
        print('=deletou');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("erro no DIo");
      print(e);
      return (false);
    }
  }

  @override
  Future<dynamic> put(String url, dynamic data) async {
    print(data);
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String token = sp.getString('token')!;
      //print(token);

      _dio.options.headers["Authorization"] = "Bearer $token";
      final response = await _dio.put(
        url,
        data: data,
      );
      print('body: ${response.data}');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('editou convite');
        return true;
      } else {
        print(response.extra);
        print(response.headers);
        return false;
      }
    } catch (e) {
      print('erro dio');
      print(e);
      return 'erro';
    }
  }
}
