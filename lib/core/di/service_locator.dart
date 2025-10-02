import 'package:athlio/core/networking/dio_factory.dart';
import 'package:athlio/features/login/data/repos/login_repo_implement.dart';
import 'package:athlio/features/login/presentation/manager/login/login_cubit.dart';
import 'package:athlio/features/login/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Step 1: Register Dio
  getIt.registerLazySingleton<Dio>(
    () => DioFactory().getDio(),
  );

  // Step 2: Register Service
  getIt.registerLazySingleton<LoginService>(
    () => LoginService(
      getIt<Dio>(),
    ),
  );

  // Step 3: Register Repo
  getIt.registerLazySingleton<LoginRepoImplement>(
    () => LoginRepoImplement(
      getIt<LoginService>(),
    ),
  );

  // Step 4: Register Cubit (prefer factory for fresh instances)
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<LoginRepoImplement>(),
    ),
  );
}
