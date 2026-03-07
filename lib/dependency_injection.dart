import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geometry_app/data/repositories/user_repository_impl.dart';
import 'package:geometry_app/data/sources/auth_firebase.dart';
import 'package:geometry_app/data/sources/user_firestore.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';
import 'package:geometry_app/domain/usecases/get_all_user_usecase.dart';
import 'package:geometry_app/domain/usecases/get_user_by_id_usecase.dart';
import 'package:geometry_app/domain/usecases/post_user_usecase.dart';
import 'package:geometry_app/domain/usecases/save_answer_usecase.dart';
import 'package:geometry_app/domain/usecases/update_user_usecase.dart';
import 'package:geometry_app/domain/usecases/user_login_usecase.dart';
import 'package:geometry_app/domain/usecases/user_register_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUp() {
  // Database Singleton
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<UserFirestore>(() => UserFirestore());
  sl.registerLazySingleton<AuthFirebase>(() => AuthFirebaseImpl(sl()));

  // Repository Singleton
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl(), sl()),
  );

  // Usecase Singleton
  sl.registerLazySingleton<GetUserByIdUsecase>(() => GetUserByIdUsecase(sl()));
  sl.registerLazySingleton<GetAllUserUsecase>(() => GetAllUserUsecase(sl()));
  sl.registerLazySingleton<PostUserUsecase>(() => PostUserUsecase(sl()));
  sl.registerLazySingleton<UpdateUserUsecase>(() => UpdateUserUsecase(sl()));
  sl.registerLazySingleton<UserLoginUsecase>(() => UserLoginUsecase(sl()));
  sl.registerLazySingleton<UserRegisterUsecase>(
    () => UserRegisterUsecase(sl()),
  );
  sl.registerLazySingleton<SaveAnswerUsecase>(() => SaveAnswerUsecase(sl()));
}
