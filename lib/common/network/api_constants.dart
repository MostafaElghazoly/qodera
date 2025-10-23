class ApiConstants {
  static String apiLang = "locale";
  static String authorization = "Authorization";
  static String requiresToken = "requiresToken";

  static Map<String, dynamic> customQueryParams() {
    return {"limit": 10, "page": 1};
  }

  static Map<String, dynamic> copyOfQueryParams(Iterable<MapEntry<String, dynamic>> entries) {
    Map<String, dynamic> param = customQueryParams();
    param.addEntries(entries);
    return param;
  }
}
