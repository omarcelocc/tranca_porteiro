class LinkarModel {
  final String token;
  final int idCondo;

  /*{
id, cpf, ,nome, sobrenome, email, id condomínio, data nasci, cidade, unidade, data criação, tipo, data atualização}*/

  LinkarModel({
    required this.idCondo,
    required this.token,
  });

  static LinkarModel fromJson(dynamic map) {
    return LinkarModel(
      idCondo: map['id_condo'],
      token: map['token'],
    );
  }
}
