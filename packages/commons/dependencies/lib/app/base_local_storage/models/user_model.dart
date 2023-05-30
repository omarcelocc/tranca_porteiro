// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String nome;
  String sobrenome;
  String tipo;
  String unidade;
  String email;
  String data;
  String cpf;
  UserModel({
    required this.nome,
    required this.sobrenome,
    required this.tipo,
    required this.unidade,
    required this.email,
    required this.data,
    required this.cpf,
  });

  static UserModel fromJson(Map<String, dynamic> map) {
    return UserModel(
        nome: map["nome"],
        sobrenome: map["sobrenome"],
        tipo: map["tipo"],
        unidade: map["unidade"],
        email: map["email"],
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
