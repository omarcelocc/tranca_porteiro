
import 'package:dio/dio.dart';

import '../interface/http_client_interface.dart';
// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class DioClient implements IHttpClient {
  final Dio _dio = Dio();
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
      String error = e.toString();
      if (error.contains('401')) {
        return 401;//sem autorização
      }
      else if (error.contains('403')) {
        return 403;//proibido
      }
      else if (error.contains('404')) {
        return 404;//não encontrado
      } else {
        return 0;//erro de conexão
      }
    }
  }

  @override
  Future<dynamic> get(String url) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = sp.getString('token')!;
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      String error = e.toString();
      if (error.contains('401')) {
        return 401;//sem autorização
      }
      else if (error.contains('403')) {
        return 403;//proibido
      }
      else if (error.contains('404')) {
        return 404;//não encontrado
      } else {
        return 0;//erro de conexão
      }
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
      String error = e.toString();
      if (error.contains('401')) {
        return 401;//sem autorização
      }
      else if (error.contains('403')) {
        return 403;//proibido
      }
      else if (error.contains('404')) {
        return 404;//não encontrado
      } else {
        return 0;//erro de conexão
      }
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
      String error = e.toString();
      if (error.contains('401')) {
        return 401;//sem autorização
      }
      else if (error.contains('403')) {
        return 403;//proibido
      }
      else if (error.contains('404')) {
        return 404;//não encontrado
      } else {
        return 0;//erro de conexão
      }
    }
  }
}

