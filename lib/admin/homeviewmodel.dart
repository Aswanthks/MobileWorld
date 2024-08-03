// import 'dart:io';
//
// import 'package:ecomnode/screens/home_page.dart';
// import 'package:ecomnode/services/product_service.dart';
// import 'package:flutter/material.dart';
//
//
// import '../model/product_model.dart';
// import 'homeservice.dart';
//
// class HomeViewModel extends ChangeNotifier {
//   bool loading = false;
//   List<Productmodel> products = [];
//
//
//   final _productService = HomeServices();
//
//   Future<void> addProduct(
//       {required Productmodel product,
//         required File imageFile,
//         required BuildContext context}) async {
//     try {
//       loading = true;
//       notifyListeners();
//
//       await _productService.addProduct(product: product, imageFile: imageFile);
//       const CircularProgressIndicator();
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Product Added Successfully"),
//       ));
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Home()));
//       loading = false;
//       notifyListeners();
//     } catch (e) {
//       loading = false;
//       notifyListeners();
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Failed to add product: $e"),
//       ));
//     }
//   }
//
//   Future<void> fetchProducts(BuildContext context) async {
//     loading = true;
//     notifyListeners();
//     try {
//       products = await _productService.getProducts();
//
//
//
//       notifyListeners();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Failed to fetch products: $e"),
//       ));
//     } finally {
//       loading = false;
//       notifyListeners();
//     }
//   }
// }