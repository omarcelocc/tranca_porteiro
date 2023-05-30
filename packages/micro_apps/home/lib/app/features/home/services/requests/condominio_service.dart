import 'package:dependencies/app/base_local_storage/services/local_storage/condominio_local.dart';
import 'package:dependencies/app/base_local_storage/services/local_storage/ids_local.dart';
import 'package:home/app/features/home/models/ids_model.dart';
import '../clients/http_client_interface.dart';

class CondominioService {
  final url = 'https://tranca-api.herokuapp.com/condominio/id/';
  final IHttpClient client;
  CondominioService(this.client);
  IDsLocal _idsLocal = IDsLocal();
  CondominioLocal condominioLocal = CondominioLocal();
  Future<dynamic> getCondo() async {
    try {
      await _idsLocal.startBanco();
      await condominioLocal.startBanco();
      String token = _idsLocal.sp.getString('token')!;
      IDsModel ids = IDsModel.fromList(_idsLocal.sp.getStringList('ids')!);
      String id = ids.idCondo.toString();
      final query = await client.get(url + id, token);
      //CondominioModel dataUser = CondominioModel.fromJson(query);
      return query;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
