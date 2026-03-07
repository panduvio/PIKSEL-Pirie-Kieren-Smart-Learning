part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetAllUser extends UserEvent {}

class GetUserById extends UserEvent {
  final String uid;

  GetUserById(this.uid);
}

class SaveAnswer extends UserEvent {
  final AnswerEntity answer;
  final String uid;

  SaveAnswer(this.answer, this.uid);
}

class LoginUser extends UserEvent {
  final String email;
  final String password;

  LoginUser(this.email, this.password);
}

class RegisterUser extends UserEvent {
  final UserEntity user;
  final String email;
  final String password;

  RegisterUser(this.user, this.email, this.password);
}

class PostUser extends UserEvent {
  final UserEntity user;

  PostUser({required this.user});
}

class UpdateUser extends UserEvent {
  final UserEntity user;

  UpdateUser({required this.user});
}
