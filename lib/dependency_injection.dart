import 'package:geometry_app/data/repositories/user_repository_impl.dart';
import 'package:geometry_app/data/sources/user_firestore.dart';
import 'package:geometry_app/domain/repositories/user_repository.dart';
import 'package:geometry_app/domain/usecases/get_all_user_usecase.dart';
import 'package:geometry_app/domain/usecases/post_user_usecase.dart';
import 'package:geometry_app/domain/usecases/update_user_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUp() {
  // Database Singleton
  sl.registerLazySingleton<UserFirestore>(() => UserFirestore());

  // Repository Singleton
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Usecase Singleton
  sl.registerLazySingleton<GetAllUserUsecase>(() => GetAllUserUsecase(sl()));
  sl.registerLazySingleton<PostUserUsecase>(() => PostUserUsecase(sl()));
  sl.registerLazySingleton<UpdateUserUsecase>(() => UpdateUserUsecase(sl()));
}
