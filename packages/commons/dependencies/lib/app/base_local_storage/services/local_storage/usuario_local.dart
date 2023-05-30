import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioLocal extends ChangeNotifier {
  List<String> usuario = [];
  late SharedPreferences sp;
  UsuarioLocal() {
    startBanco();
  }
  Future<void> startBanco() async {
    sp = await SharedPreferences.getInstance();
  }

  setUsuario(List<String> usuario) async {
    sp = await SharedPreferences.getInstance();
    await sp.setStringList('usuario', usuario);
    getUsuario();
    notifyListeners();
  }

  getUsuario()async {
    sp = await SharedPreferences.getInstance();
    usuario = sp.getStringList('usuario') ?? [];
    notifyListeners();
  }

  updateUsuario(List<String> usuario) async {
    await setUsuario(usuario);
  }
}
