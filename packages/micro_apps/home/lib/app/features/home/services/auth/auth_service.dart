import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (await sp.clear()) {
      return true;
    }
    return false;
  }
}