import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Future<bool> verificarToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }

  
}
