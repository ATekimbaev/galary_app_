import 'package:bloc/bloc.dart';
import 'package:gallary_app/%20feauture/domain/repositories/create_user_repo.dart';


class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({required this.repo}) : super(CreateAccountInitial()) {
    on<CreateAccountEvent>((event, emit) {
    });
  }
  late final CreateUserRepo repo;
}

abstract class CreateAccountEvent {}

abstract class CreateAccountState {}

class CreateAccountInitial extends CreateAccountState {}
