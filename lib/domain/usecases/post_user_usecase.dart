import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class PostUserUsecase {
  final UserRepository repository;

  PostUserUsecase(this.repository);

  Future<String> postUser(UserEntity userData) {
    return repository.postUser(userData);
  }
}
