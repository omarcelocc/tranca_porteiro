abstract class IHttpClient {
  Future<dynamic> post(String url, dynamic data);
  Future<dynamic> get(String url);
  Future<dynamic> delete(String url);
  Future<dynamic> put(String url, dynamic data);
}
