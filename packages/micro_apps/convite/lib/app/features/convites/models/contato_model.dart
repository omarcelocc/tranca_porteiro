// ignore_for_file: public_member_api_docs, sort_constructors_first
class ContatoModel {
  int id;
  int idUser;
  final String documento;
  final String nome;

  ContatoModel({
    required this.id,
    required this.idUser,
    required this.documento,
    required this.nome,
  });

  static ContatoModel fromJson(Map<String, dynamic> map) {
    return ContatoModel(
        documento: map['documento'],
        id: map['id'],
        nome: map['nome'],
        idUser: map['usuario_id']);
  }

  static Map<String, dynamic> toJson(ContatoModel convite) {
    Map<String, dynamic> mapa = {
      "documento": convite.documento,
      "nome": convite.nome,
      "usuario_id": convite.idUser,
    };
    return mapa;
  }

  static List<ContatoModel> fromJsonAll(List<dynamic> convites) {
    List<ContatoModel> allConvites = [];
    for (var convite in convites) {
      allConvites.add(ContatoModel.fromJson(convite));
    }
    return allConvites;
  }
}
