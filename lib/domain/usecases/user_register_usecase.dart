import 'package:dartz/dartz.dart';
import 'package:geometry_app/core/error/failures.dart';
import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class UserRegisterUsecase {
  final UserRepository repository;

  UserRegisterUsecase(this.repository);

  Future<Either<Failure, Unit>> userRegister(
    UserEntity user,
    String email,
    String password,
  ) async {
    final result = await repository.userRegister(email, password);

    return result.fold((failure) => Left(failure), (uid) async {
      print('Register success. on register usecase get user id: $uid');
      final newUser = user.copyWith(id: uid);
      await repository.postUser(newUser);
      final answerModel = AnswerEntity();
      await repository.saveAnswers(answerModel, uid);
      return Right(unit);
    });
  }
}
