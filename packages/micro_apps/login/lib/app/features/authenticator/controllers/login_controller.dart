import 'package:flutter/widgets.dart';
import 'package:login/app/features/authenticator/models/cadastro_model.dart';

import '../models/login_model.dart';
import '../services/auth/cadastro_service.dart';
import '../services/auth/login_service.dart';

class LoginController extends ChangeNotifier {
  final LoginService _service;

  LoginController(this._service);

  Future<bool> fazerLogin(LoginModel data) async {
    var login = await _service.login(data);
    var getDados = await _service.getDados();
    if (login && getDados) {
      return true;
    } else {
      return false;
    }
   
  }
}
