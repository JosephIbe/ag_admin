part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];

}

class ProductsStateInitial extends ProductsState {}

class ProductsStateLoading extends ProductsState {}

class ProductsStateGetAllProductsSuccess extends ProductsState {

  // final List<Product> products;
  // const ProductsStateGetAllProductsSuccess({required this.products});
  //
  // @override
  // List<Object> get props => [products];

}