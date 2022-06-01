import 'package:bloc/bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeHaveAccountState()) {
    on<WelcomeCreateAccountEvent>(_createAccount);
    on<WelcomeHaveAccountEvent>(_haveAccount);
   
  }
  Future<void> _createAccount(event, Emitter<WelcomeState> emit)async{
    emit(WelcomeCreateAccountState());
  }
  Future<void> _haveAccount(event, Emitter<WelcomeState> emit)async{
    emit(WelcomeHaveAccountState());
  }
}

abstract class WelcomeEvent {}

class WelcomeCreateAccountEvent extends WelcomeEvent {}

class WelcomeHaveAccountEvent extends WelcomeEvent {}

abstract class WelcomeState {}

class WelcomeHaveAccountState extends WelcomeState {}
class WelcomeCreateAccountState extends WelcomeState {}
