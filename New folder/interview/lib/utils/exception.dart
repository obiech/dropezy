class GeneralException implements Exception {
  String msg;
  GeneralException(this.msg);

  @override
  String toString() => 'AuthException: $msg';
}
