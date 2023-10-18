import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/api/product_response.dart';
import '../../../../service/api_service.dart';

part 'productlist_event.dart';
part 'productlist_state.dart';

class ProductlistBloc extends Bloc<ProductlistEvent, ProductlistState> {
  final APIService _apiService;
  var index=0;
  ProductlistBloc(this._apiService) : super(ProductlistInitial()) {
    on<ProductApiEvent>((event, emit)async {
      index++;
      log("called ===="+index.toString());
      emit(LoadingState());
      final response = await _apiService.getProducts();
      if (response.code==401) {
        emit(
          UnAuthorizedState(),
        );
      } else if (response.code == 500) {
        emit(
          ErrorState(),
        );
      } else if (response.code == 503) {
        // log(">>>>>>>>>>");
        emit(NoInternetState());

      } else {
        emit(
            LoadedState(response));
      }

    });
  }
}
