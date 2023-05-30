// ignore_for_file: avoid_print

import 'dart:async';

import 'package:convite/app/features/convites/models/ids_model.dart';
import 'package:convite/app/features/convites/services/requests/convite_service.dart';
import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:flutter/material.dart';

import '../models/convite_model.dart';
import '../services/validators/formatar_datetime.dart';

class ConviteController extends ChangeNotifier {
  ConviteService service;
  ConviteController(this.service);
  var convite;
  var allConvitesUser = <ConviteModel>[];
  var allConvitesCondo = <ConviteModel>[];
  var allConvites = <ConviteModel>[];
  IDsLocal _iDsLocal = IDsLocal();
  Future<void> criarConvite(ConviteModel dados) async {
    allConvitesUser.add(dados);
    notifyListeners();
    /*
    var request = await service.postConvite(dados);
    convite = request;
    print('valor convite controller = $convite');
    //convite pode ser true=cadastrado com sucesso, false= não cadastrado, 'erro'= erro na comunicação
    notifyListeners();*/
  }

  Future<void> getConvitesUsuario() async {
    Timer(Duration(seconds: 2), () {
      allConvitesUser = [
        ConviteModel(
            documento: '05413279541',
            dataEntrada: '05/06/2023',
            horaInicio: '10:30',
            horaFim: '11:00',
            nome: 'João Ávila',
            tipo: 'CONVIDADO',
            status: 'ATIVO'),
        ConviteModel(
            documento: '05413279541',
            dataEntrada: '30/05/2023',
            horaInicio: '19:30',
            horaFim: '21:00',
            nome: 'David Silva',
            tipo: 'CONVIDADO',
            status: 'EXPIRADO'),
        ConviteModel(
            documento: '05413279541',
            dataEntrada: '02/06/2023',
            horaInicio: '12:30',
            horaFim: '15:00',
            nome: 'Bruno Sigama',
            tipo: 'CONVIDADO',
            status: 'PENDENTE'),
        ConviteModel(
            documento: '05413279541',
            dataEntrada: '10/06/2023',
            horaInicio: '10:30',
            horaFim: '11:00',
            nome: 'José Costa',
            tipo: 'PRESTADOR',
            status: 'ATIVO'),
        ConviteModel(
            documento: '05413279541',
            dataEntrada: '05/06/2023',
            horaInicio: '10:30',
            horaFim: '11:00',
            nome: 'Maria Soares',
            tipo: 'CONVIDADO',
            status: 'FINALIZADO'),
      ];
      notifyListeners();
    });

    /*
    var request = await service.getConvitesUser();
    print('request: $request');
    if (request != 'erro' &&
        request != '401' &&
        request != '403' &&
        request != '404') {
      List<dynamic> data = request['convites'];
      allConvitesUser = ConviteModel.fromJsonAll(data);
      await _iDsLocal.startBanco();
      IDsModel ids = IDsModel.fromList(_iDsLocal.sp.getStringList('ids')!);
      int idUser = ids.idUser;
      for (var convite in allConvitesUser) {
        print('entrou no for');
        await expirarConvite(convite);
      }
    } else {
      request = null;
    }
    allConvitesUser = allConvitesUser.reversed.toList();
    notifyListeners();*/
  }

  Future<bool> deletarConvite(int idConvite) async {
    /*
    bool request = await service.deletarConvite(idConvite);
    return request;
    */
    return true;
  }

  Future<void> expirarConvite(ConviteModel convite) async {
    await _iDsLocal.startBanco();
    IDsModel ids = IDsModel.fromList(_iDsLocal.sp.getStringList('ids')!);
    String idCondo = ids.idCondo.toString();
    if (convite.status != 'EXPIRADO' && convite.status != 'FINALIZADO') {
      DateTime dataEntrada = FormatarDateTime().toDate(convite.dataEntrada);
      print(convite);
      if (dataEntrada.month <= DateTime.now().month &&
          dataEntrada.day <= DateTime.now().day) {
        print('dia igual');
        TimeOfDay horaFim = FormatarDateTime().toTime(convite.horaFim);
        print(horaFim);
        if (dataEntrada.day < DateTime.now().day) {
          var expirando = await service.editarConvite(convite.id, {
            "status": "EXPIRADO",
            "nome": convite.nome,
            "documento": convite.documento,
            "usuario_id": convite.idUser,
            "condominio_id": idCondo,
            "hr_inicio": convite.horaInicio,
            "hr_fim": convite.horaFim,
            "tipo": convite.tipo,
            "dt_entrada": convite.dataEntrada,
          });
          if (expirando == true) {
            print('expirou convite com sucesso');
            convite.status = 'EXPIRADO';
          } else {
            print('erro na requisição');
          }
        } else if (horaFim.hour <= TimeOfDay.now().hour &&
            horaFim.minute <= TimeOfDay.now().minute) {
          print('Detectou convite expirado');
          print('idUser: ${convite.idUser}');
          var expirando = await service.editarConvite(convite.id, {
            "status": "EXPIRADO",
            "nome": convite.nome,
            "documento": convite.documento,
            "usuario_id": convite.idUser,
            "condominio_id": idCondo,
            "hr_inicio": convite.horaInicio,
            "hr_fim": convite.horaFim,
            "tipo": convite.tipo,
            "dt_entrada": convite.dataEntrada,
          });
          if (expirando == true) {
            print('expirou convite com sucesso');
            convite.status = 'EXPIRADO';
          } else {
            print('erro na requisição');
          }
        }
      } else {
        allConvitesCondo.remove(convite);
      }
    }
  }
}
