abstract class IHttpClient {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic data);
  Future<dynamic> postAuth(String url, dynamic data);
  Future<dynamic> postToken(
      String url, dynamic data, String token);
}
