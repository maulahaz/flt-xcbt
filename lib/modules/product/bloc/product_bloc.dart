import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:xcbt/modules/product/all_product.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<ProductRequested>(_handleProductRequested);
    on<ProductAddedToCart>(_handleProductAddedToCart);
    on<ProductRemovedFromCart>(_handleProductRemovedFromCart);
  }

  final ProductService api = ProductService();

  Future<void> _handleProductRequested(
      ProductRequested event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));

      final response = await api.getProducts();

      emit(state.copyWith(status: ProductStatus.success, products: response));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> _handleProductAddedToCart(
      ProductAddedToCart event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(cartId: {...state.cartId, event.cartId}));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> _handleProductRemovedFromCart(
      ProductRemovedFromCart event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(cartId: {...state.cartId}..remove(event.cartId)));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }
}
