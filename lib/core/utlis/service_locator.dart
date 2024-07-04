import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qeema_tech/core/utlis/api_service.dart';
import 'package:qeema_tech/features/home/data/repo/repo_impl.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<RepoImpl>(RepoImpl(getIt.get<ApiService>()));
}
