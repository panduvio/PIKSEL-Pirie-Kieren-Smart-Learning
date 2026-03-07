import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geometry_app/dependency_injection.dart';
import 'package:geometry_app/domain/entities/answer_entity.dart';
import 'package:geometry_app/domain/entities/user_entity.dart';
import 'package:geometry_app/domain/usecases/get_all_user_usecase.dart';
import 'package:geometry_app/domain/usecases/get_user_by_id_usecase.dart';
import 'package:geometry_app/domain/usecases/post_user_usecase.dart';
import 'package:geometry_app/domain/usecases/save_answer_usecase.dart';
import 'package:geometry_app/domain/usecases/update_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:geometry_app/domain/usecases/user_login_usecase.dart';
import 'package:geometry_app/domain/usecases/user_register_usecase.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(TryToGetState()) {
    on<GetAllUser>(_getAllUser);
    on<GetUserById>(_getUserById);
    on<PostUser>(_postUser);
    on<UpdateUser>(_updateUser);
    on<LoginUser>(_loginUser);
    on<RegisterUser>(_registerUser);
    on<SaveAnswer>(_saveAnswer);
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

  void _getUserById(GetUserById event, Emitter<UserState> emit) async {
    emit(TryToGetState());
    try {
      final user = await sl<GetUserByIdUsecase>().getUserById(event.uid);
      emit(GetUserByIdSuccessState(user));
    } catch (e) {
      emit(FailedToGetState());
      throw Exception('Failed to get user data: $e');
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

  void _loginUser(LoginUser event, Emitter<UserState> emit) async {
    emit(TryToLoginState());
    try {
      final result = await sl<UserLoginUsecase>().userLogin(
        event.email,
        event.password,
      );

      result.fold(
        (failure) => emit(FailedToLoginState()),
        (answer) => emit(LoginSuccessState(answer)),
      );
    } catch (e) {
      emit(FailedToRegisterState());
      throw Exception('Failed to login: $e');
    }
  }

  void _registerUser(RegisterUser event, Emitter<UserState> emit) async {
    emit(TryToRegisterState());
    try {
      final result = await sl<UserRegisterUsecase>().userRegister(
        event.user,
        event.email,
        event.password,
      );

      result.fold(
        (failure) => emit(FailedToRegisterState()),
        (user) => emit(RegisterSuccessState()),
      );
    } catch (e) {
      emit(FailedToRegisterState());
    }
  }

  void _saveAnswer(SaveAnswer event, Emitter<UserState> emit) async {
    emit(TryToGetState());
    try {
      await sl<SaveAnswerUsecase>().saveAnswers(event.answer, event.uid);
      emit(SaveSuccessState());
    } catch (e) {
      emit(FailedToGetState());
    }
  }
}
