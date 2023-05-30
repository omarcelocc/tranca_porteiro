// ignore_for_file: public_member_api_docs, sort_constructors_first
class CondominioModel {
 // final int id;
  final String cnpj;
  final String nome;
  final String telefone;
  final String endereco;
  final String descricao;
  final String latitude;
  final String longetude;
  CondominioModel({
    //required this.id,
    required this.cnpj,
    required this.nome,
    required this.telefone,
    required this.endereco,
    required this.descricao,
    required this.latitude,
    required this.longetude,
  });

  static CondominioModel fromJson(Map<String, dynamic> map) {
    return (CondominioModel(
      //id: map['id'],
      cnpj: map['cnpj'],
      nome: map['nome'],
      telefone: map['telefone'],
      endereco: map['endereco'],
      descricao: map['descricao'],
      latitude: map['latitude'],
      longetude: map['longetude'],
    ));
  }
    static CondominioModel fromList(List<String> lista) {
    return (CondominioModel(
      cnpj: lista[0],
      nome: lista[1],
      telefone: lista[2],
      endereco: lista[3],
      descricao: lista[4],
      latitude: lista[5],
      longetude: lista[6],
    ));
  }

  static List<String> toList(CondominioModel condominio) {
    return <String>[
      condominio.cnpj,
      condominio.nome,
      condominio.telefone,
      condominio.endereco,
      condominio.descricao,
      condominio.latitude,
      condominio.longetude
    ];
  }
}
