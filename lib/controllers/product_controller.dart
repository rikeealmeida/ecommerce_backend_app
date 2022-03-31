import 'package:flutter_ecommerce_manager/models/product_model.dart';
import 'package:flutter_ecommerce_manager/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;
  
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void saveNewProductPrice(
    Product product,
    String field,
    double value,
  ) {
    database.updateField(product, field, value);
  }

  void saveNewProductQuantity(
    Product product,
    String field,
    int value,
  ) {
    database.updateField(product, field, value);
  }

  void updateProductQuantity(int index, Product product, int value) {
    product.quantity = value;
    products[index] = product;
  }

  // void onChangedSearch(String search) {
  //   if (search.trim().isEmpty) {
  //     _productsController.add(_products.values.toList());
  //   } else {
  //     _productsController.add(_filter(search.trim()));
  //   }
  // }

  // List<Map<String, dynamic>> _filter(String search) {
  //   List<Map<String, dynamic>> filteredProducts =
  //       List.from(_products.values.toList());
  //   filteredProducts.retainWhere((product) {
  //     return ("${product['id']}${product['category']}${product['description']}")
  //         .toUpperCase()
  //         .contains(search.toUpperCase());
  //   });
  //   return filteredProducts;
  // }
}
