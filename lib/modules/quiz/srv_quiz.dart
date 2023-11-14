// import 'package:dio/dio.dart';
// import 'package:xcbt/configs/all_configs.dart';
// import 'package:xcbt/modules/product/all_product.dart';

// class ProductService {
//   final Dio _client = Dio(BaseOptions(baseUrl: API_URL_1 + 'products'));

//   Future<List<ProductModel>> getProducts() async {
//     final response = await _client.get('');
//     List _products = response.data;
//     return _products
//         .map((el) => ProductModel(
//               id: el['id'],
//               title: el['title'],
//               image: el['image'],
//             ))
//         .toList();
//   }
// }
