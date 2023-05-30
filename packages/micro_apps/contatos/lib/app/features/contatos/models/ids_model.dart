// ignore_for_file: public_member_api_docs, sort_constructors_first
class IDsModel {
  final int idUser;
  final int idCondo;
  final String documento;
  IDsModel({
    required this.idUser,
    required this.idCondo,
    required this.documento,
  });

  static IDsModel fromJson(Map<String, dynamic> mapa){
    return IDsModel(
      idUser: mapa['usuario_id'],
       idCondo: mapa['condominio_id'], 
       documento: mapa['documento'],
       );
  }
  
  static IDsModel fromList(List<String> lista) {
    return IDsModel(
      idUser: int.parse(lista[0]),
      idCondo: int.parse(lista[1]),
      documento: lista[2],
    );
  }

  static List<String> toList(IDsModel ids) {
    return <String>[
      ids.idUser.toString(),
      ids.idCondo.toString(),
      ids.documento
    ];
  }
}
