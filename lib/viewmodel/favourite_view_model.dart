import 'package:flutter/material.dart';

import '../model/favorite_model.dart';
import '../model/product_model.dart';

import '../services/favorite_service.dart';

import 'package:flutter/material.dart';
import '../model/product_model.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/product_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  FavoriteViewModel() {
    _loadFavorites();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonFavorites = _favorites.map((item) => json.encode(item.toJson())).toList();
    prefs.setStringList('favorites', jsonFavorites);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonFavorites = prefs.getStringList('favorites');
    if (jsonFavorites != null) {
      _favorites = jsonFavorites.map((item) {
        final jsonItem = json.decode(item);
        return ProductModel.fromJson(jsonItem);
      }).toList();
      notifyListeners();
    }
  }

  bool isFavorite(ProductModel product) {
    return _favorites.contains(product);
  }

  void addToFavorites(ProductModel product) {
    if (!isFavorite(product)) {
      _favorites.add(product);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFromFavorites(ProductModel product) {
    if (isFavorite(product)) {
      _favorites.remove(product);
      _saveFavorites();
      notifyListeners();
    }
  }
}


class WishViewModel extends ChangeNotifier {
  bool loading = false;
  List<WishModel> wishItems = [];
  List<ProductModel> wishData = [];

  final _wishService = WishService();

  // Add product to cart
  Future<void> addProductToWish({
    required String userid,
    required ProductModel product,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();

      await _wishService.addProductToWish(userid: userid, product: product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product added to wishlist successfully"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to add product to cart: $e"),
      ));
    } finally {
      loading = false;
      notifyListeners();
    }
  }

// Fetch wishlist contents for a user
  Future<void> fetchWishContents(String userid, BuildContext context) async {
    loading = true;
    notifyListeners();

    try {
      wishItems = await _wishService.getWishContents(userid);

      wishData.clear();

      for (var wishItem in wishItems) {
        if (wishItem.productid != null) {
          wishData.add(wishItem.productid!);
        }
      }

      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to fetch wishlist contents: $e"),
      ));
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  // Remove product from cart
  Future<void> removeProductFromWish({
    required String userid,
    required String productId,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();
      await _wishService.removeProductFromWish(
          userid: userid, productId: productId);
      wishItems.removeWhere((item) => item.productid?.sId == productId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Product removed from cart successfully"),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to remove product from cart: $e"),
      ));
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}