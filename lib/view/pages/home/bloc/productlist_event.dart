part of 'productlist_bloc.dart';

abstract class ProductlistEvent extends Equatable {
  const ProductlistEvent();

}
class ProductApiEvent extends ProductlistEvent{
  @override
  List<Object?> get props => [];

}