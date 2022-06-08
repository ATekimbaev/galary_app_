import 'package:bloc/bloc.dart';

import 'package:gallary_app/%20feauture/domain/repositories/login_repo.dart';

class HaveAccountBloc extends Bloc<HaveAccountEvent, HaveAccountState> {
  HaveAccountBloc({required this.repo}) : super(CreateAccountState()) {
    on<CreateAccountEvent>(_createAccount);

    try {
      on<LogInEvent>(_getSecret);
    } catch (e) {
      emit(LoginErrorState()); 
    }
  }
  late final LoginRepo repo;
  Future<void> _createAccount(event, Emitter<HaveAccountState> emit) async {
    emit(CreateAccountState());
  }

  Future<void> _getSecret(event, Emitter<HaveAccountState> emit) async {
    emit(LogInState());

    final getClientSecret = await repo.logIn(name: event.email);
    final getToken = await repo.getToken(
        name: event.email,
        password: event.password,
        secret: getClientSecret.secret,
        id: getClientSecret.id,
        randomId: getClientSecret.randomId);
    Future.delayed(const Duration(seconds: 2));
    emit(LoginSuccesState(
        refreshToken: getToken.refreshToken,
        acsessToken: getToken.accessToken));
  }
}

abstract class HaveAccountState {}

class CreateAccountState extends HaveAccountState {}

class LogInState extends HaveAccountState {}

class LoginSuccesState extends HaveAccountState {
  final String refreshToken;
  final String acsessToken;
  LoginSuccesState({
    required this.refreshToken,
    required this.acsessToken,
  });
}

class LoginErrorState extends HaveAccountState {}

abstract class HaveAccountEvent {}

class CreateAccountEvent extends HaveAccountEvent {}

class LogInEvent extends HaveAccountEvent {
  final String email;
  final String password;
  LogInEvent({
    required this.email,
    required this.password,
  });
}
