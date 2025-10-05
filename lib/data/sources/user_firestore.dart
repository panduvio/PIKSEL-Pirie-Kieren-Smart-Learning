import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';

class UserFirestore {
  final _db = FirebaseFirestore.instance;

  create(UserEntity user) async {
    try {
      final response = await _db.collection('users').add(user.toMap());
      print('success to create response with this id: ${response.id}');
    } catch (e) {
      log(e.toString());
      print('failed e');
    }
    print('tried');
  }

  getAllUser() async {
    try {
      final response = await _db.collection('users').get();
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
      final response = await _db.collection('users').add(user.toMap());
      print('success to create response with this id: ${response.id}');
      return response.id;
    } catch (e) {
      log(e.toString());
      print('failed e');
    }
    print('tried');
  }

  updateUser(UserEntity user) async {
    try {
      await _db.collection('users').doc(user.id).update(user.toMap());
      print('success');
    } catch (e) {
      log(e.toString());
      print('failed e');
    }
    print('tried');
  }
}
