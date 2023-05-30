import 'package:contatos/app/features/contatos/models/ids_model.dart';
import 'package:dependencies/dependencies.dart';

import '../../models/contato_model.dart';
import '../clients/http_client_interface.dart';

class ContatoService {
  final url = 'https://tranca-api.herokuapp.com/contatos/';
  final urlByUser = 'https://tranca-api.herokuapp.com/contatos/usuario/';

  final IHttpClient client;
  ContatoService(this.client);
  IDsLocal _iDsLocal = IDsLocal();

  Future<dynamic> getContatosUser() async {
    try {
      await _iDsLocal.startBanco();
      IDsModel ids = IDsModel.fromList(_iDsLocal.sp.getStringList('ids')!);

      String id = ids.idUser.toString();
      final query = await client.get(urlByUser + id);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> postContato(ContatoModel data) async {
    try {
      final query = await client.post(url, ContatoModel.toJson(data));
      print('retorno service = $query');
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> deletarContato(int idContato) async {
    try {
      final query = await client.delete(url + idContato.toString());
      return query;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> editarContato(int idContato, dynamic data) async {
    try {
      final query = await client.put(url + idContato.toString(), data);
      return query;
    } catch (e) {
      rethrow;
    }
  }
}
