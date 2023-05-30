// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  //int id;
  String nome;
  String sobrenome;
  String tipo;
  String unidade;
  String email;
  //int idCondo;
  String data;
  String cpf;
  UserModel({
    //required this.id,
    required this.nome,
    required this.sobrenome,
    required this.tipo,
    required this.unidade,
    required this.email,
   // required this.idCondo,
    required this.data,
    required this.cpf,
  });

  static UserModel fromJson(Map<String, dynamic> map) {
    return UserModel(
      //id: map["id"],
      nome: map["nome"],
      sobrenome: map["sobrenome"],
      tipo: map["tipo"],
      unidade: map["unidade"],
      email: map["email"],
      //idCondo: map["condominio_id"],
      data: map["data_nascimento"],
      cpf: map["documento"]);
  }

   static List<String> toList(UserModel usuario) {
    return <String>[
      usuario.nome,
      usuario.sobrenome,
      usuario.cpf,
      usuario.email,
      usuario.tipo,
      usuario.data,
      usuario.unidade,
    ];
  }

  static UserModel fromList(List<String> lista) {
    return UserModel(
      nome: lista[0],
      sobrenome: lista[1],
      cpf: lista[2],
      email: lista[3],
      tipo: lista[4],
      data: lista[5],
      unidade: lista[6],
    );
  }
}
