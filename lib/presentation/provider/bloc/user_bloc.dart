import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/dependency_injection.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/usecases/get_all_user_usecase.dart';
import 'package:geometry_app/domain/usecases/post_user_usecase.dart';
import 'package:geometry_app/domain/usecases/update_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(TryToGetState()) {
    on<GetAllUser>(_getAllUser);
    on<PostUser>(_postUser);
    on<UpdateUser>(_updateUser);
  }

  void _getAllUser(GetAllUser event, Emitter<UserState> emit) async {
    emit(TryToGetState());
    try {
      final users = await sl<GetAllUserUsecase>().getAllUser();
      emit(GetAllSuccessState(users));
    } catch (e) {
      throw Exception('Failed to get all data: $e');
    }
  }

  void _postUser(PostUser event, Emitter<UserState> emit) async {
    emit(TryToPostState());
    try {
      final id = await sl<PostUserUsecase>().postUser(event.user);
      emit(PostSuccessState(id));
      // add(GetAllUser());
      print('success add');
    } catch (e) {
      print('failed add');
      throw Exception('Failed to post user: $e');
    }
  }

  void _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(TryToPostState());
    try {
      await sl<UpdateUserUsecase>().updateUser(event.user);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
