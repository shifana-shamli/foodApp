part of 'productlist_bloc.dart';

@immutable
abstract class ProductlistState {}

class ProductlistInitial extends ProductlistState {
  @override
  List<Object> get props => [];
}

class ErrorState extends ProductlistState {
  ErrorState();

  @override
  List<Object> get props => [];
}

class UnAuthorizedState extends ProductlistState {
  UnAuthorizedState();

  @override
  List<Object?> get props => [];
}

class NoInternetState extends ProductlistState {

  @override
  List<Object?> get props => [];
}

class LoadingState extends ProductlistState {
  @override
  List<Object> get props => [];
}


class LoadedState extends ProductlistState{
  ProductResponse response;
  LoadedState(this.response);
  @override
  List<Object> get props => [];
}
