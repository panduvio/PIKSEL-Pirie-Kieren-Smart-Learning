import 'package:geometry_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getAllUser();
  Future<String> postUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
}
