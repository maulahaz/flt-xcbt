import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/modules/product/all_product.dart';
import 'package:xcbt/modules/product/views/product_vw.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductView(
          title: 'Product App',
        ),
      ),
    );
  }
}


