import 'package:fake_store/core/exception/exception.dart';


abstract class Failure {}

class ServerFailure implements Failure {
  final String failureMessege;
  final String failureCode;

  ServerFailure({
    required this.failureMessege,
    required this.failureCode,
  });

  factory ServerFailure.fromServerExseption(ServerExseption exseption) {
    return ServerFailure(
      failureMessege: exseption.errorMassege,
      failureCode: exseption.errorCode,
    );
  }

  @override
  String toString() => 'ServerFailure(failureMessege: $failureMessege, failureCode: $failureCode)';
}
