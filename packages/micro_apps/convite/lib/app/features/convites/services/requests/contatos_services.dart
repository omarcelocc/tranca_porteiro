import 'package:convite/app/features/convites/models/ids_model.dart';
import 'package:dependencies/app/base_api/services/interface/http_client_interface.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/contato_model.dart';

class ContatoService {
  final url = 'https://tranca-api.herokuapp.com/contatos/';
  final urlByUser = 'https://tranca-api.herokuapp.com/contatos/usuario/';

  final IHttpClient client;
  ContatoService(this.client);
  IDsLocal _iDsLocal = IDsLocal();

  Future<dynamic> getContatosUser() async {
    await _iDsLocal.startBanco();
    IDsModel ids = IDsModel.fromList(_iDsLocal.sp.getStringList('ids')!);
    String id = ids.idUser.toString();
    final query = await client.get(urlByUser + id);
    return query;
  }

  Future<dynamic> postContato(ContatoModel data) async {
    final query = await client.post(url, ContatoModel.toJson(data));
    print('retorno service = $query');
    return query;
  }
}
