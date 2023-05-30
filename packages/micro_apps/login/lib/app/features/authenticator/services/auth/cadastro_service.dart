// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:login/app/features/authenticator/models/cadastro_model.dart';
import 'package:login/app/features/authenticator/models/login_model.dart';
import 'package:login/app/features/authenticator/services/auth/login_service.dart';
import 'package:login/app/features/authenticator/services/clients/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../clients/http_client_interface.dart';

class CadastroService {
  final url = 'https://tranca-api.herokuapp.com/usuario';
  final urlLogin = 'https://tranca-api.herokuapp.com/auth';
  final urlLinkar = 'https://tranca-api.herokuapp.com/usu_condominio';

  final IHttpClient client;

  CadastroService(this.client);

  Future<bool> cadastrar(CadastroModel data) async {
        print('cadastroService');
    final dadosLogin = LoginModel(email: data.email, senha: data.senha);
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      //cadastro
      await client.post(
        url,
        CadastroModel.toJson(data),
      );
      print('finalizou tentativa de cadastro');
      //fazerlogin
      final login = await LoginService(DioClient()).login(dadosLogin);
      print('finalizou tentativa de login');
      if (login) {
        print('fez login');
        String token = sp.getString('token')!;
        print('pegou o token: $token');
        if (token != '') {
          print('entrou na condição');
          final linkar = await client.postToken(
              urlLinkar,
              jsonEncode(
                {
                "condominio": {
                  "id": data.idCondo
                  }
                }
              )
              ,
              token);
          print('finalizou tentativa de linkar');

          return linkar;
        } else {
          print('token nulo');
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }

    //final todos = (body as List).map(CadastroModel.fromJson).toList();
  }
}
