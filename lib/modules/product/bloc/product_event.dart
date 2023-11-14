abstract class ProductEvent {
  const ProductEvent();
}

class ProductRequested extends ProductEvent {}

class ProductAddedToCart extends ProductEvent {
  final int cartId;
  ProductAddedToCart({required this.cartId});
}

class ProductRemovedFromCart extends ProductEvent {
  final int cartId;
  ProductRemovedFromCart({required this.cartId});
}
