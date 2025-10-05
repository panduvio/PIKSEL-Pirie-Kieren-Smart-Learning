part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TryToGetState extends UserState {}

class TryToPostState extends UserState {}

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
