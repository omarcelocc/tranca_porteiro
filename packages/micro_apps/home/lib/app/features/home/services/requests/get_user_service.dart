import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:dependencies/dependencies.dart';
import 'package:home/app/features/home/models/ids_model.dart';
import '../clients/http_client_interface.dart';

class UserService {
  final url = 'https://tranca-api.herokuapp.com/usuario/';
  final IHttpClient client;
  UserService(this.client);
  var idsLocal = IDsLocal();

  Future<dynamic> getUser() async {
    try {
      await idsLocal.startBanco();
      String token = idsLocal.sp.getString('token')!;
      String doc =
          IDsModel.fromList(idsLocal.sp.getStringList('ids')!).documento;
      print(doc);
      final query = await client.get(url + doc, token);
      print('get user');
      //UserModel dataUser = UserModel.fromJson(query);
      print(query);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
