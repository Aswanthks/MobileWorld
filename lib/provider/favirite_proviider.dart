// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../model/product_model.dart';
//
//
//
// class FavoriteProvider extends ChangeNotifier {
//   final List<Productmodel> _favorite = [];
//   List<Productmodel> get favorites => _favorite;
//   void toggleFavorite(Productmodel product) {
//     if (_favorite.contains(product)) {
//       _favorite.remove(product);
//     } else {
//       _favorite.add(product);
//     }
//     notifyListeners();
//   }
//
//   bool isExist(Productmodel product) {
//     final isExist = _favorite.contains(product);
//     return isExist;
//   }
//
//   static FavoriteProvider of(BuildContext context, {bool listen = true}) {
//     return Provider.of<FavoriteProvider>(
//       context,
//       listen: listen,
//     );
//   }
// }