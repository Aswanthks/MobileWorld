
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../viewmodel/favourite_view_model.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("Favorites",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 25),),
      ),
      body: Consumer<FavoriteViewModel>(
        builder: (context, favoriteViewModel, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(15.0),
            itemCount: favoriteViewModel.favorites.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              childAspectRatio: .8,
            ),
            itemBuilder: (BuildContext context, int index) {
              final item = favoriteViewModel.favorites[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                          child: SizedBox(
                            height: 140,
                            width: 140,
                            child: Image.network(
                              item.image ?? "",
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 8,
                          child: IconButton(
                            onPressed: () {
                              final favoriteViewModel = Provider.of<FavoriteViewModel>(context, listen: false);
                              favoriteViewModel.removeFromFavorites(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Item removed from favorites!'),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item.name ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            item.price.toString() ?? "",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
