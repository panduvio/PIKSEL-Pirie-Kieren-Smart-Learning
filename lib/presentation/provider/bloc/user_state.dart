part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TryToGetState extends UserState {}

class TryToPostState extends UserState {}

class TryToLoginState extends UserState {}

class TryToRegisterState extends UserState {}

class FailedToGetState extends UserState {}

class FailedToLoginState extends UserState {}

class FailedToRegisterState extends UserState {}

class RegisterSuccessState extends UserState {}

class SaveSuccessState extends UserState {}

class LoginSuccessState extends UserState {
  final AnswerEntity _answer;

  LoginSuccessState(this._answer);

  AnswerEntity get answer => _answer;
}

class PostSuccessState extends UserState {
  final String id;
  PostSuccessState(this.id);

  @override
  List<Object?> get props => [id];
}

class GetAllSuccessState extends UserState {
  final List<UserEntity> users;
  GetAllSuccessState(this.users);

  @override
  List<Object?> get props => [users];
}

class GetUserByIdSuccessState extends UserState {
  final UserEntity user;
  GetUserByIdSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class GetAnswerSuccessState extends UserState {
  final AnswerEntity answer;
  GetAnswerSuccessState(this.answer);

  @override
  List<Object?> get props => [answer];
}
