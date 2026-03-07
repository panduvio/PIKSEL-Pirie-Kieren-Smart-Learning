import 'package:dartz/dartz.dart';
import 'package:geometry_app/core/error/failures.dart';
import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getAllUser();
  Future<UserEntity> getUserById(String uid);
  Future<String> postUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Future<void> saveAnswers(AnswerEntity answers, String uid);
  Future<AnswerEntity> getAnswersById(String uid);
  Future<Either<Failure, String>> userLogin(String email, String password);
  Future<Either<Failure, String>> userRegister(String email, String password);
}
