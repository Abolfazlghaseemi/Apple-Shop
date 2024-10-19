class ApiException implements Exception {
  int? code;
  String? massage;
  ApiException(this.code, this.massage);
}
