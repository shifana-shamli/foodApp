import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:loginpage/utils/app_sp.dart';
import 'package:meta/meta.dart';

import '../../../../data/api/login_us_response.dart';
import '../../../../service/api_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final APIService _apiService;
  LoginBloc(this._apiService) : super(LoginInitial()) {
    on<LoginApiEvent>((event, emit)async {
      final response = await _apiService.getLogin(
          event.mobileNo.toString(), event.password.toString());
      if (response.code==401) {
        emit(
          UnAuthorizedState(),
        );
      } else if (response.code == 500) {
        emit(
           ErrorState(),
        );
      } else if (response.code == 503) {
        emit(
          NoInternetState(),
        );
      } else {
        emit(
         LoginSuccessState(response));

      }


});
  }
}
