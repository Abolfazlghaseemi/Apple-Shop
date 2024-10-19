import 'package:bloc/bloc.dart';
import 'package:ecommerce_project_main/bloc/authentication/auth_event.dart';
import 'package:ecommerce_project_main/data/di/di.dart';
import 'package:ecommerce_project_main/data/respository/authentication_repository.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>(((event, emit) async {
      emit(AuthLoadingState());
      var reponse = await _repository.login(event.username, event.password);
      emit(AuthResponseState(reponse));
    }));

    on<AuthRegisterRequest>(((event, emit) async {
      emit(AuthLoadingState());
      var reponse = await _repository.register(
          event.username, event.password, event.passwordConfirm);
      emit(AuthResponseState(reponse));
    }));
  }
}
