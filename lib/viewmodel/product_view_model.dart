import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  bool loading = false;
  List<ProductModel> products = [];

  final _productService = ProductServices();

  Future<void> fetchProducts() async {
    loading = true;
    notifyListeners();

    try {
      products = await _productService.getProducts();
      print(products);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      print('An error occurred: $e');
    }
  }
}