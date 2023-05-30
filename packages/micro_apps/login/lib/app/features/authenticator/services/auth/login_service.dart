import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:login/app/features/authenticator/models/ids_model.dart';
import 'package:login/app/features/authenticator/models/login_model.dart';
import 'package:login/app/features/authenticator/models/token_model.dart';

import '../clients/http_client_interface.dart';

class LoginService {
  final url = 'http://tranca-api.herokuapp.com/auth';
  final urlToken = 'http://tranca-api.herokuapp.com/usuario/perfil';

  final IHttpClient client;

  LoginService(this.client);
  var bdLocal = IDsLocal();
  Future<bool> login(LoginModel data) async {
    final cadastro = await client.postAuth(
      url,
      LoginModel.toJson(data),
    );
    if (cadastro != '') {
      String token = TokenModel.fromJson(cadastro).token;
      print(token);
      await bdLocal.sp.setString('token', token);

      //final todos = (body as List).map(CadastroModel.fromJson).toList();
      return true;
    }
    return false;
  }

  Future<bool> getDados() async {
    final getDados = await client.get(urlToken);
    if (getDados != 'error') {
      var dados =  IDsModel.fromJson(getDados);
      await bdLocal.setIds(IDsModel.toList(dados));
      print('guardou dados');
      return true;
    } else {
      return false;
    }
  }
}
