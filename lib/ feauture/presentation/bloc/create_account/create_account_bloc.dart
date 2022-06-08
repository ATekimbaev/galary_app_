import 'package:bloc/bloc.dart';

import 'package:gallary_app/%20feauture/domain/repositories/create_user_repo.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({required this.repo}) : super(CreateAccountInital()) {
    on<CreateAccountEvent>(_createAccount);
  }
  late final CreateUserRepo repo;

  Future<void> _createAccount(event, Emitter<CreateAccountState> emit) async {
    emit(CreateAccountInital());

    final newAccount = await repo.createUser(event.email, event.phone,
        event.fullName, event.password, event.username, event.birthday);

    Future.delayed(const Duration(seconds: 2));
    emit(CreateAccountSuccesState(newAccount));
  }
}

abstract class CreateAccountState {}

class CreateAccountInital extends CreateAccountState{}

class CreateAccountSuccesState extends CreateAccountState {
  final result;
  CreateAccountSuccesState(this.result);
}

class CreateAccountErrorState extends CreateAccountState {}

abstract class CreateAccountEvent {}

class CreateAccount extends CreateAccountEvent {
  String email;
  String phone;
  String fullName;
  String password;
  String username;
  DateTime birthday;
  CreateAccount({
    required this.email,
    required this.phone,
    required this.fullName,
    required this.password,
    required this.username,
    required this.birthday,
  });
}
