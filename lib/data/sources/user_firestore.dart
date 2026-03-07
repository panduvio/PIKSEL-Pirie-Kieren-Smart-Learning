import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geometry_app/core/error/failures.dart';
import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';

class UserFirestore {
  final _db = FirebaseFirestore.instance;
  final String userTable = 'mockUsers'; // users
  final String answerTable = 'answers'; // answers

  getAllUser() async {
    try {
      final response = await _db.collection(userTable).get();
      final users = response.docs
          .map((doc) => UserEntity.fromSnapshot(doc))
          .toList();

      print('success');
      return users;
    } catch (e) {
      log(e.toString());
      print('failed e');
    }
    print('tried');
  }

  postUser(UserEntity user) async {
    try {
      await _db.collection(userTable).doc(user.id).set(user.toMap());
      print('success to create response with this id: ${user.id}');
      return user.id;
    } catch (e) {
      log(e.toString());
      print('failed e');
    }
    print('tried');
  }

  Future<AnswerEntity?> saveAnswer(AnswerEntity answer, String uid) async {
    try {
      print('uid on source save answer: $uid');

      // Set data in Firestore
      await _db
          .collection(answerTable)
          .doc(uid)
          .set(answer.copyWith(id: uid).toMap());

      // Fetch the updated snapshot
      final snapshot = await _db.collection(answerTable).doc(uid).get();

      if (snapshot.exists) {
        final answers = AnswerEntity.fromSnapshot(snapshot);
        print('Successfully saved and retrieved answer for: ${snapshot.id}');
        return answers;
      }
    } catch (e) {
      log(e.toString());
      print('failed e: $e');
    }

    return null;
  }

  Future<AnswerEntity?> getAnswersById(String uid) async {
    try {
      final snapshot = await _db.collection(answerTable).doc(uid).get();

      if (snapshot.exists) {
        final answers = AnswerEntity.fromSnapshot(snapshot);
        print('Successfully saved and retrieved answer for: ${snapshot.id}');
        return answers;
      }
    } catch (e) {
      log(e.toString());
      print('failed e: $e');
    }
    ;
    return null;
  }

  Future<UserEntity> getUserById(String uid) async {
    try {
      final snapshot = await _db.collection(userTable).doc(uid).get();

      if (!snapshot.exists) {
        throw UserFailure('User not found');
      }

      final user = UserEntity.fromSnapshot(snapshot);
      return user;
    } catch (e) {
      throw UserFailure('Failed to fetch user data.');
    }
  }

  updateUser(UserEntity user) async {
    try {
      await _db.collection(userTable).doc(user.id).update(user.toMap());
      print('success');
    } catch (e) {
      log(e.toString());
      print('failed e');
    }
    print('tried');
  }
}
