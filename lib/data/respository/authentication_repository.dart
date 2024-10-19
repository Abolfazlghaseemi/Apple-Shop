import 'package:dartz/dartz.dart';
import 'package:ecommerce_project_main/data/datasource/authentication_datasource.dart';
import 'package:ecommerce_project_main/data/di/di.dart';
import 'package:ecommerce_project_main/util/api_exception.dart';
import 'package:ecommerce_project_main/util/auth_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);
      Future<Either<String, String>> login(
      String username, String password);
}

class AuthenticationRepository implements IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();
  final SharedPreferences _sharedPref=locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasource.register(
          'AbolfazlGhaseeeemi', 'Abolfazl9850', 'Abolfazl9850');
      return right('ثبت نام انجام شد!');
    } on ApiException catch (ex) {
      return left(ex.massage ?? 'خطایی محتوایی وجود ندارد');
    }
  }
  
  @override
  Future<Either<String, String>> login(String username, String password) async{
 try {
  String token=await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManger.saveToken(token);
        _sharedPref.setString('access_token:',token);
        return right('شما وارد شده اید ');
      } else {
        return left('خطایی پیش آمده است !');
      }
    } on ApiException catch (ex) {
      return left('${ex.massage}');
    }  
  }
}
