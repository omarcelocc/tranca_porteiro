// ignore_for_file: public_member_api_docs, sort_constructors_first
class CadastroModel {
  final int idCondo;
  final String nome;
  final String sobrenome;
  final String senha;
  final String data;
  final String tipo;
  final String documento;
  final String email;
  final String status;
  final String unidade;
  final String telefone;

  /*{
id, cpf, ,nome, sobrenome, email, id condomínio, data nasci, cidade, unidade, data criação, tipo, data atualização}*/

  CadastroModel({
    required this.idCondo,
    required this.nome,
    required this.sobrenome,
    required this.senha,
    required this.data,
    required this.tipo,
    required this.documento,
    required this.email,
    required this.status,
    required this.unidade,
    required this.telefone,
  });


  static CadastroModel fromJson(dynamic map) {
    return CadastroModel(
      telefone: map['telefone'],
      idCondo: map['idCondo'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      senha: map['senha'],
      data: map['data_nascimento'],
      tipo: map['tipo'],
      documento: map['documento'],
      email: map['email'],
      status: map['status'],
      unidade: map['unidade'],
    );
  }

  static Map<String, dynamic> toJson(CadastroModel cadastro) {
    Map<String, dynamic> mapa = {
      'telefone':cadastro.telefone,
      'nome': cadastro.nome,
      'sobrenome': cadastro.sobrenome,
      'senha': cadastro.senha,
      'data_nascimento': cadastro.data,
      'tipo': cadastro.tipo,
      'documento': cadastro.documento,
      'email': cadastro.email,
      'status': cadastro.status,
      'unidade': cadastro.unidade,
    };

    return mapa;
  }
}
