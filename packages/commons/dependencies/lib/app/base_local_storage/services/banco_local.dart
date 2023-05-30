import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BancoLocal extends ChangeNotifier {
  late SharedPreferences _banco;

  BancoLocal() {
    _startBanco();
  }

  Future<void> _startBanco() async {
    _banco = await SharedPreferences.getInstance();
  }
}
