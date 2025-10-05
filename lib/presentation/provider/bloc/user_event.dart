part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetAllUser extends UserEvent {}

class PostUser extends UserEvent {
  final UserEntity user;

  PostUser({required this.user});
}

class UpdateUser extends UserEvent {
  final UserEntity user;

  UpdateUser({required this.user});
}
