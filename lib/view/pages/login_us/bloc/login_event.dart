part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {

}
class LoginApiEvent extends LoginEvent{
  String ? mobileNo;
  String? password;

  LoginApiEvent(
      this.mobileNo,
      this.password,
      );
  List<Object?> get props => [
    mobileNo,
    password,
  ];

}