abstract class IclientHttp {
  void addToken(String token);

  Future? get(String url);
}
