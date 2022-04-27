import 'package:meta/meta.dart';

abstract class ApiClient<T> {
  Future<T> get(String endpoint);

  @visibleForTesting
  @protected
  @mustCallSuper
  T throwIfNot(
      {required T Function() response,
      required bool Function() condition,
      required Exception Function() error}) {
    if (!condition()) {
      throw error();
    } else {
      return response();
    }
  }
}
