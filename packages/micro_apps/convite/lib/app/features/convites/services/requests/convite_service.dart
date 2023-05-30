import 'package:dependencies/app/base_api/services/interface/http_client_interface.dart';
import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/convite_model.dart';
import '../../models/ids_model.dart';

class ConviteService {
  final url = 'https://tranca-api.herokuapp.com/convites/';
  final urlByUser = 'https://tranca-api.herokuapp.com/convites/usuario/';

  final IHttpClient client;
  ConviteService(this.client);
  IDsLocal _ids = IDsLocal();
  Future<dynamic> getConvite() async {
    try {
      String id = '1';
      final query = await client.get(url + id);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getConvitesUser() async {
    try {
      await _ids.startBanco();
      IDsModel ids = IDsModel.fromList(_ids.sp.getStringList('ids')!);
      String id = ids.idUser.toString();
      final query = await client.get(urlByUser + id);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getConvitesCondo() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String id = sp.getString('idCondo')!;
      final query = await client.get(url + id);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> getAllConvites() async {
    try {
      String id = '1';
      final query = await client.get(url + id);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> postConvite(ConviteModel data) async {
    try {
      final query = await client.post(url, ConviteModel.toJson(data));
      print('retorno service = $query');
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> deletarConvite(int idConvite) async {
    try {
      final query = await client.delete(url + idConvite.toString());
      return query;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> editarConvite(int idConvite, dynamic data) async {
    try {
      final query = await client.put(url + idConvite.toString(), data);
      return query;
    } catch (e) {
      rethrow;
    }
  }
}
