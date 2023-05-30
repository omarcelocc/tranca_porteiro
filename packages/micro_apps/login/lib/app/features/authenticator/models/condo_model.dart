class CondoModel {

  final String nome;
  final int id;
 

  /*{
id, cpf, ,CondoModel, sobreCondoModel, nome, id condomínio, data nasci, cidade, unidade, data criação, tipo, data atualização}*/

  CondoModel(
      {
      required this.nome, 
      required this.id,

      });

  static CondoModel fromJson(dynamic map) {
    return CondoModel(
      nome: map['nome'],
      id: map['id'],  
    );
  }

    static Map<String, dynamic> toJson(CondoModel condo) {
    Map<String, dynamic> mapa = {   
      'nome': condo.nome,
      'id': condo.id,
    };

    return mapa;
  }

}