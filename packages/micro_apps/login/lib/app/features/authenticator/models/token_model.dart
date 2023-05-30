class TokenModel {

  final String token;

 

  /*{
id, cpf, ,nome, sobrenome, email, id condomínio, data nasci, cidade, unidade, data criação, tipo, data atualização}*/

  TokenModel(
      {
      required this.token, 
      });

  static TokenModel fromJson(dynamic map) {
    return TokenModel(
      token: map['token'],
    );
  }


}