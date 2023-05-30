// ignore_for_file: avoid_print

import 'dart:async';

import 'package:contatos/app/features/contatos/services/requests/contatos_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/contato_model.dart';
import '../services/validators/formatar_datetime.dart';

class ContatoController extends ChangeNotifier {
  ContatoService service;
  ContatoController(this.service);
  var convite;
  var allContatosUser = <ContatoModel>[];

  Future<void> getContatosUsuario() async {

    Timer(Duration(seconds: 2), () {
      allContatosUser = [
        ContatoModel(
            id: 0, idUser: 0, documento: '05421326951', nome: 'Joao Ávila'),
        ContatoModel(
            id: 1, idUser: 0, documento: '05421326951', nome: 'Jonas Henrique'),
        ContatoModel(
            id: 2,
            idUser: 0,
            documento: '05421326951',
            nome: 'Maria Antonieta'),
        ContatoModel(
            id: 3,
            idUser: 0,
            documento: '05421326951',
            nome: 'Genivalda Motta'),
        ContatoModel(
            id: 4, idUser: 0, documento: '05421326951', nome: 'Pedro Avelino'),
        ContatoModel(
            id: 5, idUser: 0, documento: '05421326951', nome: 'Charles Neves'),
        ContatoModel(
            id: 6, idUser: 0, documento: '05421326951', nome: 'Bruno Sigama'),
      ];
      notifyListeners();
    });
    /*
    var request = await service.getContatosUser();
    print('request: $request');
    if (request != 'erro' &&
        request != '401' &&
        request != '403' &&
        request != '404') {
      List<dynamic> data = request['contatos'];
      allContatosUser = ContatoModel.fromJsonAll(data);
    } else {
      request = null;
    }
    notifyListeners();
    */
  }

  Future<bool> deletarContato(int idContato) async {
    bool request = await service.deletarContato(idContato);
    return request;
  }

  Future<bool> editarContato(ContatoModel contato) async {
    bool request =
        await service.editarContato(contato.id, ContatoModel.toJson(contato));
    return request;
  }
}
