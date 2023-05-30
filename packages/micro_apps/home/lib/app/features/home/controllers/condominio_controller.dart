// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:dependencies/app/base_local_storage/services/local_storage/condominio_local.dart';
import 'package:flutter/widgets.dart';

import '../models/condominio_model.dart';
import '../services/requests/condominio_service.dart';

class CondominioController extends ChangeNotifier {
  CondominioService service;
  CondominioController(
    this.service,
  );

  String error = '';
  final CondominioLocal _condominioLocal = CondominioLocal();
  var condominio;
  var condominioLocal;
  Future<void> getCondo() async {
    Timer(Duration(seconds: 2), () {
      condominio = CondominioModel(
          cnpj: '123.44555-665.77',
          nome: 'Alpha Ville',
          telefone: '(98) 99607-9869',
          endereco: 'Rua Fulando de Tal',
          descricao: 'Um bom condominio',
          latitude: '123135055',
          longetude: "13135405");
      notifyListeners();
    });
    /*
    await CondominioLocal().startBanco();
    var result = await service.getCondo();
    if (result != '401' && result != '403' && result != '404') {

      condominio = CondominioModel.fromJson(result as Map<String, dynamic>);
      await _condominioLocal.setCondominio(CondominioModel.toList(condominio));
      notifyListeners();
    } else {
      error = result.toString();
      print(error);

      notifyListeners();
    }*/
  }

  getCondoLocal() async {
     Timer(Duration(seconds: 2), () {
      condominio = CondominioModel(
          cnpj: '123.44555-665.77',
          nome: 'Alpha Ville',
          telefone: '(98) 99607-9869',
          endereco: 'Rua Fulando de Tal',
          descricao: 'Um bom condominio',
          latitude: '123135055',
          longetude: "13135405");
      notifyListeners();
    });
    /*
    await CondominioLocal().startBanco();
    List<String> lista = _condominioLocal.sp.getStringList('condominio') ?? [];
    if (lista.isNotEmpty) {
      condominioLocal = CondominioModel.fromList(lista);
    }
    notifyListeners();*/
  }
}
