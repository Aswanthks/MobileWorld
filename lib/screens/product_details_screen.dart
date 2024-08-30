
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';
import '../services/auth_service.dart';
import '../viewmodel/cart_view_model.dart';
import '../widgets/ar_view.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel item;

  ProductDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  item.image ?? "",
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArPage(
                        imageUrl: item.image ?? "",
                      ),
                    ),
                  );
                },
                child: Text("View in AR"),
              ),

              ElevatedButton(
                onPressed: () {
                  print('Adding item to cart: ');

                  final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
                  cartViewModel.addProductToCart(
                    userid: Authserrvices.userId.toString(), // Replace with actual user ID
                    product: item,
                    context: context,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Item added to cart!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 24),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),



              Text(
                item.name ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                item.description ?? "",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Price: ${item.price.toString()}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
        
              SizedBox(height: 16),

        
            ],
          ),
        ),
      ),
    );
  }
}
