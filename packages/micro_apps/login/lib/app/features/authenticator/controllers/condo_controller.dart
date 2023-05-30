import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:login/app/features/authenticator/models/condo_model.dart';
import '../services/auth/condo_service.dart';

class CondoController extends ChangeNotifier {
  final CondoService _service;
  var todos = <CondoModel>[];
  CondoController(this._service);

  Future<void> get() async {
    Timer(Duration(seconds: 2), () {
      todos = [
        CondoModel(nome: 'Belize', id: 0),
        CondoModel(nome: 'Apha Ville', id: 1),
        CondoModel(nome: 'Brisas', id: 2),
        CondoModel(nome: 'Lara Liotto', id: 3),
        CondoModel(nome: 'Lara Liotto II', id: 4),
        CondoModel(nome: 'Tom Jobim', id: 5),
        CondoModel(nome: 'Colina dos Colibris', id: 6),
        CondoModel(nome: 'Parque Vinhais', id: 7),
        CondoModel(nome: 'Gran Park', id: 8),
        CondoModel(nome: 'Gran Park II', id: 9),
      ];
      // todos = await _service.getAllCondo();
      notifyListeners();
    });
  }
}
