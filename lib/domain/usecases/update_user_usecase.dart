import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository repository;

  UpdateUserUsecase(this.repository);

  Future<void> updateUser(UserEntity userData) {
    return repository.updateUser(userData);
  }
}
