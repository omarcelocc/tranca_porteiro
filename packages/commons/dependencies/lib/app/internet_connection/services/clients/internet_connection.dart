// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

//...............IMPORTANTE.................//
//Adicione esses dois packages como dependencia no pubspec do seu projeto
//  internet_connection_checker: ^1.0.0+1
//  connectivity_plus: ^2.3.8
class InternetConnection {
  //stream
  late StreamSubscription subscription;
  //variavél de estado de conexão
  var estaConectado = false;
  //variavel de estado de popUp
  bool mostrandoPopUp = false;

  //metodo para capturar e mostrar popup na mudança de estado de conexão
  getConectividade(BuildContext context) => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        estaConectado = await InternetConnectionChecker().hasConnection;
        //se não estiver conectado e nem mostrando o popup
        if (!estaConectado && mostrandoPopUp == false) {
          popUpInternet(context);
          mostrandoPopUp = true;
        }
      });
  //metodo que retorna o popUp
  popUpInternet(BuildContext context) => showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Sem internet'),
          content: const Text('Por favor, verifique sua conexão!'),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  mostrandoPopUp = false;
                  //conseguindo o estado da conexão
                  estaConectado =
                      await InternetConnectionChecker().hasConnection;
                  //se não estiver conectado
                  if (!estaConectado) {
                    popUpInternet(context);
                    mostrandoPopUp = true;
                  }
                },
                child: const Text('OK'))
          ],
        );
      });
}
