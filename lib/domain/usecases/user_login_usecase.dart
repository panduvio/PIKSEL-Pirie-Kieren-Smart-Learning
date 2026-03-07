import 'package:dartz/dartz.dart';
import 'package:geometry_app/core/error/failures.dart';
import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class UserLoginUsecase {
  final UserRepository repository;

  UserLoginUsecase(this.repository);

  Future<Either<Failure, AnswerEntity>> userLogin(
    String email,
    String password,
  ) async {
    final authResult = await repository.userLogin(email, password);

    return authResult.fold((failure) => Left(failure), (uid) async {
      print('uid on login usecase: $uid');
      final answer = await repository.getAnswersById(uid);
      print('Answer Model' + '${answer.toMap()}');
      return Right(answer);
    });
  }
}
