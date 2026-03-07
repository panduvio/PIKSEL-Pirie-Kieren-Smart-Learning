import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';

class SaveAnswerUsecase {
  final UserRepository repository;

  SaveAnswerUsecase(this.repository);

  Future<void> saveAnswers(AnswerEntity answers, uid) async {
    await repository.saveAnswers(answers, uid);
  }
}
