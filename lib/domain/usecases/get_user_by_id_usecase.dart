import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class GetUserByIdUsecase {
  final UserRepository repository;

  GetUserByIdUsecase(this.repository);

  Future<UserEntity> getUserById(String uid) async {
    return await repository.getUserById(uid);
  }
}
