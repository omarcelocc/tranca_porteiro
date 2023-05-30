// ignore_for_file: public_member_api_docs, sort_constructors_first
class ConviteModel {
  var id;
  var idUser;
  var idCondo;
  final String documento;
  final String dataEntrada;
  final String horaInicio;
  final String horaFim;
  final String nome;
  final String tipo;
  String status;

  ConviteModel({
    this.id,
    this.idUser,
    this.idCondo,
    required this.documento,
    required this.dataEntrada,
    required this.horaInicio,
    required this.horaFim,
    required this.nome,
    required this.tipo,
    required this.status,
  });

  static ConviteModel fromJson(Map<String, dynamic> map) {
    return ConviteModel(
        status: map['status']==null?'ATIVO':map['status'],
        idCondo: map['condominio_id']==null?0:map['condominio_id'],
        documento: map['documento'],
        dataEntrada: map['dt_entrada']==null?'Data':map['dt_entrada'],
        id: map['id'],
        nome: map['nome'],
        tipo: map['tipo'],
        idUser: map['usuario_id'],
        horaInicio: map['hr_inicio'],
        horaFim: map['hr_fim']);
  }

  static Map<String, dynamic> toJson(ConviteModel convite) {
    Map<String, dynamic> mapa = {
      "condominio_id": convite.idCondo,
      "documento": convite.documento,
      "dt_entrada": convite.dataEntrada,
      "nome": convite.nome,
      "tipo": convite.tipo,
      "usuario_id": convite.idUser,
      "hr_inicio": convite.horaInicio,
      'hr_fim': convite.horaFim,
      'status': convite.status
    };
    return mapa;
  }

  static List<ConviteModel> fromJsonAll(List<dynamic> convites) {
    List<ConviteModel> allConvites = [];
    for (var convite in convites) {
      allConvites.add(ConviteModel.fromJson(convite));
    }
    return allConvites;
  }
}
