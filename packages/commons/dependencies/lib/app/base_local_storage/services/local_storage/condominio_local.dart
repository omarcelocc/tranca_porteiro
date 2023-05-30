import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CondominioLocal extends ChangeNotifier {
  List<String> condominio = [];
  late SharedPreferences sp;
  CondominioLocal() {
    startBanco();
  }
  startBanco() async {
    sp = await SharedPreferences.getInstance();
  }

  setCondominio(List<String> condominio) async {
    getCondominio();
    await sp.setStringList('condominio', condominio);
    notifyListeners();
  }

  getCondominio() {
    condominio = sp.getStringList('condominio') ?? [];
    notifyListeners();
  }

  updateCondominio(List<String> condominio) async {
    await setCondominio(condominio);
  }
}
