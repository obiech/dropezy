import 'package:equatable/equatable.dart';
import 'package:utils/utils.dart';

class AppError extends Equatable {
  final String errMessage;

  const AppError({this.errMessage = 'Unknown Error.'});

  factory AppError.fromCode(AppException exception) {
    final String err;
    switch (exception.code) {
      case 500:
        err = 'Internal Server Error.';
        break;
      default:
        err = 'Unknown Error.';
    }
    return AppError(errMessage: err);
  }
  @override
  List<Object?> get props => [errMessage];
}
