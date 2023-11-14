import 'package:xcbt/modules/product/all_product.dart';
// import 'package:xcbt/product/product/product_event.dart';

enum ProductStatus { unknown, loading, success, failure }

class ProductState {
  final List<ProductModel> products;
  final ProductStatus status;
  final Set<int> cartId;

  ProductState(
      {this.products = const [],
      this.status = ProductStatus.unknown,
      this.cartId = const {}});

  ProductState copyWith({
    List<ProductModel>? products,
    ProductStatus? status,
    Set<int>? cartId,
  }) =>
      ProductState(
          products: products ?? this.products,
          status: status ?? this.status,
          cartId: cartId ?? this.cartId);
}

final class ProductInitial extends ProductState {}
