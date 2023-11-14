class ProductModel {
  final int id;
  final String title;
  final String image;

  ProductModel(
      {required this.id,
      required this.title,
      required this.image});

  // factory ProductModel.fromModel(Map<String, dynamic> json) => ProductModel(
  //     id: json['id'],
  //     title: json['firstName'],
  //     image: json['lastName']);
}
