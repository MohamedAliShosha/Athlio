import '../../features/auth/login/data/repos/login_repo_implement.dart';
import '../../features/auth/login/presentation/manager/login/login_cubit.dart';
import '../../features/auth/login/service/login_service.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo_implement.dart';
import '../../features/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import '../../features/auth/sign_up/service/sign_up_service.dart';

import '../networking/dio_factory.dart';

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

  getIt.registerLazySingleton<SignUpService>(
    () => SignUpService(
      getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<SignUpRepoImplement>(
    () => SignUpRepoImplement(
      getIt<SignUpService>(),
    ),
  );

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      getIt<SignUpRepoImplement>(),
    ),
  );

  // Step 4: Register Cubit (prefer factory for fresh instances)
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<LoginRepoImplement>(),
    ),
  );
}
