import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class GetAllUserUsecase {
  final UserRepository repository;

  GetAllUserUsecase(this.repository);

  Future<List<UserEntity>> getAllUser() {
    return repository.getAllUser();
  }
}
