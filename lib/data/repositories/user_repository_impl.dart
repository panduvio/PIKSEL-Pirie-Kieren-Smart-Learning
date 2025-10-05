import 'package:geometry_app/data/sources/user_firestore.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFirestore _userFirestore;

  UserRepositoryImpl(this._userFirestore);

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
}
