import 'package:dio/dio.dart';
import 'package:ecommerce_project_main/data/datasource/authentication_datasource.dart';
import 'package:ecommerce_project_main/data/respository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  locator.registerFactory<IAuthenticationDatasource>(
    () => AuthenticationRemote(),
  );
  locator.registerFactory<IAuthRepository>(
    () => AuthenticationRepository(),
  );
}
