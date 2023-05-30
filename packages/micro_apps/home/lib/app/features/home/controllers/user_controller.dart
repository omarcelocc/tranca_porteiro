// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:dependencies/app/base_local_storage/services/local_storage/usuario_local.dart';
import 'package:flutter/widgets.dart';
import 'package:home/app/features/home/services/requests/get_user_service.dart';

import '../models/user_model.dart';

class UserController extends ChangeNotifier {
  UserService service;
  UserController(
    this.service,
  );
  String error = '';
  final UsuarioLocal _usuarioLocal = UsuarioLocal();
  var usuario;
  var usuarioLocal;
  bool loading = true;
  Future<void> getUser() async {
    Timer(Duration(seconds: 2), () {
      usuario = UserModel(
          nome: 'Marcelo',
          sobrenome: 'Correia',
          tipo: 'MORADOR',
          unidade: 'Ap 305',
          email: 'marcelo@gmail.com',
          data: '28/03/2000',
          cpf: '111.222.333.44');

      notifyListeners();
    });

    /*
    var result = await service.getUser();
    if (result != '401' && result != '403' && result != '404') {
      usuario = UserModel.fromJson(result as Map<String, dynamic>);
      await _usuarioLocal.startBanco();
      await _usuarioLocal.setUsuario(UserModel.toList(usuario));
      loading = false;
      notifyListeners();
    } else {
      error = result.toString();

      notifyListeners();
    }*/
  }

  getUserLocal() async {
     Timer(Duration(seconds: 2), () {
      usuario = UserModel(
          nome: 'Marcelo',
          sobrenome: 'Correia',
          tipo: 'MORADOR',
          unidade: 'Ap 305',
          email: 'marcelo@gmail.com',
          data: '28/03/2000',
          cpf: '111.222.333.44');

      notifyListeners();
    });
    /*
    await _usuarioLocal.startBanco();
    List<String> lista = _usuarioLocal.sp.getStringList('usuario') ?? [];
    if (lista.isNotEmpty) {
      usuarioLocal = UserModel.fromList(lista);
    }
    notifyListeners();*/
  }
}
