import 'package:fake_store/core/either/either.dart';
import 'package:fake_store/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
