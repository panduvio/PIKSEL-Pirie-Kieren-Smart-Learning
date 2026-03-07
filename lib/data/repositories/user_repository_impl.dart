import 'package:dartz/dartz.dart';
import 'package:geometry_app/core/error/failures.dart';
import 'package:geometry_app/data/sources/auth_firebase.dart';
import 'package:geometry_app/data/sources/user_firestore.dart';
import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFirestore _userFirestore;
  final AuthFirebase _authFirebase;

  UserRepositoryImpl(this._userFirestore, this._authFirebase);

  @override
  Future<List<UserEntity>> getAllUser() async {
    final users = await _userFirestore.getAllUser();
    return users;
  }

  @override
  Future<String> postUser(UserEntity user) async {
    final id = await _userFirestore.postUser(user);
    return id;
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    await _userFirestore.updateUser(user);
  }

  @override
  Future<Either<Failure, String>> userLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await _authFirebase.userLogin(email, password);
      final uid = response.user?.uid;

      if (uid == null) {
        return Left(AuthFailure('User not found.'));
      }

      return Right(uid);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, String>> userRegister(
    String email,
    String password,
  ) async {
    try {
      final response = await _authFirebase.userRegister(email, password);
      final uid = response.user?.uid;

      return Right(uid!);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (_) {
      return Left(AuthFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<UserEntity> getUserById(String uid) async {
    final user = await _userFirestore.getUserById(uid);
    return user;
  }

  @override
  Future<AnswerEntity> saveAnswers(AnswerEntity answer, String uid) async {
    final answers = await _userFirestore.saveAnswer(answer, uid);
    return answers!;
  }

  @override
  Future<AnswerEntity> getAnswersById(String uid) async {
    final answer = await _userFirestore.getAnswersById(uid);
    return answer!;
  }
}
