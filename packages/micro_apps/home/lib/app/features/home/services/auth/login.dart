import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login(String email, String senha) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //aqui vamos chamar a função com httpClient
    //simulação

    if (email == LoginData().email && senha == LoginData().senha) {
      await sp.setString('token', 'Token ${LoginData().token}');
      return true;
    } else {
      return false;
    }
  }
}

class LoginData {
  String email = 'marcelo@gmail.com';
  String senha = '123456';
  String token = 'fb65hft216thdt52fh565tfh634';
}
