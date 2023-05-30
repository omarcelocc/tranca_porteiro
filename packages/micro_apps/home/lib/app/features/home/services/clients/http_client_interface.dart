abstract class IHttpClient {

  Future<dynamic> put(
      String url, dynamic data, String token);
  Future<dynamic> get(
      String url, String token);
}
