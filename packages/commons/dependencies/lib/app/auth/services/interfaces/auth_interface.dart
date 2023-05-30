abstract class Auth {
  Future<String> buscarToken();
  Future<bool> verificarToken();
}
