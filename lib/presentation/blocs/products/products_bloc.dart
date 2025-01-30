import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agoris_admin/data/models/error_response_model.dart';

import 'package:agoris_admin/domain/entities/get_all_products_params.dart';

import 'package:agoris_admin/domain/repositories/products_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final ProductsRepository _repository;

  ProductsBloc({required ProductsRepository repository})
      : _repository = repository,
        super(ProductsStateInitial()) {
    on<GetAllProductsEvent>(_getAllProducts);
  }

  _getAllProducts(GetAllProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsStateLoading());
  }

}