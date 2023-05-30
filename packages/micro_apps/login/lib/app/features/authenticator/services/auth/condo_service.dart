import '../../models/condo_model.dart';
import '../clients/http_client_interface.dart';

class CondoService {
  final url = 'https://tranca-api.herokuapp.com/condominio';
  final IHttpClient client;

  CondoService(this.client);

  Future<List<CondoModel>> getAllCondo() async {
    print('buscando condominios');
    final body = await client.get(
      url,
    );
    print(body);
    final todos = (body as List).map(CondoModel.fromJson).toList();
    return todos;
  }
}
