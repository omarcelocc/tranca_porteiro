import 'package:flutter/widgets.dart';
import 'package:login/app/features/authenticator/models/cadastro_model.dart';

import '../services/auth/cadastro_service.dart';

class CadastroController extends ChangeNotifier {
  final CadastroService _service;

  CadastroController(this._service);

  Future<bool> fazerCadastro(CadastroModel data) async {
    print('cadastroController');
    bool cadastro = await _service.cadastrar(data);
    notifyListeners();
    return cadastro;
  }
}
