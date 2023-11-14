import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/modules/product/all_product.dart';

class ProductView extends StatefulWidget {
  final String title;
  const ProductView({required this.title, Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  void _addToCart(int cartId) {
    context.read<ProductBloc>().add(ProductAddedToCart(cartId: cartId));
  }

  void _removeFromCart(int cartId) {
    context.read<ProductBloc>().add(ProductRemovedFromCart(cartId: cartId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.status == ProductStatus.loading) {
              return CircularProgressIndicator();
            }
            if (state.status == ProductStatus.failure) {
              return Column(
                children: [
                  Text('Error'),
                  SizedBox(height: 15),
                  OutlinedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(ProductRequested());
                      },
                      child: Text('Try Again'))
                ],
              );
            }
            if (state.status == ProductStatus.unknown) {
              return Column(
                children: [
                  Text('No Product'),
                  SizedBox(height: 15),
                  OutlinedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(ProductRequested());
                      },
                      child: Text('Load Product'))
                ],
              );
            }
            if (state.status == ProductStatus.success) {}
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: state.products.length,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  final inCart = state.cartId.contains(product.id);
                  return Card(
                      key: ValueKey(product.id),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Flexible(child: Image.network(product.image)),
                            SizedBox(height: 5),
                            Expanded(
                                child: Text(product.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        // fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(height: 5),
                            OutlinedButton(
                                onPressed: inCart
                                    ? () => _removeFromCart(product.id)
                                    : () => _addToCart(product.id),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: inCart
                                        ? []
                                        : [
                                            Icon(Icons.add_shopping_cart),
                                            SizedBox(width: 10),
                                            Text('Add to Cart')
                                          ],
                                  ),
                                ))
                          ],
                        ),
                      ));
                });
          },
        ),
      ),
    );
  }
}
