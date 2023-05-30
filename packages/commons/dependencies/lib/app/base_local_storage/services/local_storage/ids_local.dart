import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IDsLocal extends ChangeNotifier {
  List<String> ids = [];
  late SharedPreferences sp;
  IDsLocal() {
    startBanco();
  }
  startBanco() async {
    sp = await SharedPreferences.getInstance();
  }

  setIds(List<String> ids) async {
    await sp.setStringList('ids', ids);
    this.ids = sp.getStringList('ids') ?? [];
    print(this.ids);
    notifyListeners();
  }

  getIds() {
    notifyListeners();
  }

  updateIds(List<String> ids) async {
    await setIds(ids);
  }
}
