part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class ErrorState extends LoginState{
 ErrorState();
 @override
  List<Object> get props => [];
}

class UnAuthorizedState extends LoginState {
   UnAuthorizedState();

  @override
  List<Object?> get props => [];
   }
class NoInternetState extends LoginState {
   NoInternetState();

  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}


class LoginSuccessState extends LoginState {
  LoginUsResponse response;


  LoginSuccessState(this.response);

  @override
  List<Object> get props => [response];
}
