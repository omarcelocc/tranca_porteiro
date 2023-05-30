class LoginModel {

  final String email;
  final String senha;
 

  /*{
id, cpf, ,nome, sobrenome, email, id condomínio, data nasci, cidade, unidade, data criação, tipo, data atualização}*/

  LoginModel(
      {
      required this.email, 
      required this.senha,

      });

  static LoginModel fromJson(dynamic map) {
    return LoginModel(
      email: map['nome'],
      senha: map['senha'],  
    );
  }

    static Map<String, dynamic> toJson(LoginModel login) {
    Map<String, String> mapa = {   
      'email': login.email,
      'senha': login.senha
    };

    return mapa;
  }

}