import 'package:flutter/material.dart';
import '../model/product_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  void addToFavorites(ProductModel product) {
    if (!_favorites.contains(product)) {
      _favorites.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorites(ProductModel product) {
    _favorites.remove(product);
    notifyListeners();
  }
}
