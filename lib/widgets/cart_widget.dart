
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

import '../viewmodel/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<void>? _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<void> _loadData() async {
    final authService = Authserrvices();
    var id = await authService; // Wait for userId to load
    print('-----------------------$id');
    final cartProvider = Provider.of<CartViewModel>(context, listen: false);
    if (Authserrvices.userId != null) {
      cartProvider.fetchCartContents(Authserrvices.userId!, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartprovider = context.watch<CartViewModel>();
    final authprovider = Authserrvices();


    print(cartprovider.cartData.length);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.blue
          ),
        ),
        title: const Row(
          children: [
            SizedBox(width: 0),
            Text(
              'Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
                ,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),

      body: ListView.builder(
        itemCount: cartprovider.cartData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Adjust padding as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), // Changed radius to make corners less rounded
                border: Border.all(color: Colors.blue, width: 5), // Changed border color to blue and width to 2
                color: Colors.white, // Set background color to white
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Light grey shadow
                    spreadRadius: 2, // Spread radius of the shadow
                    blurRadius: 4, // Blur radius of the shadow
                    offset: Offset(0, 6), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        cartprovider.cartData[index].image ?? 'image'),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center, // Center the divider-like overlay
                      child: Container(
                        color: Colors.black.withOpacity(0.5), // Semi-transparent overlay color
                        width: 0.5, // Width of the overlay
                        height: 102, // Height of the overlay
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              cartprovider.cartData[index].name ?? 'name',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  print(index);
                                  print(cartprovider.cartData[index].sId);
                                  cartprovider.removeProductFromCart(
                                      userid: Authserrvices.userId!,
                                      productId:
                                      cartprovider.cartData[index].sId!,
                                      context: context);
                                  setState(() {
                                    cartprovider.cartData.removeAt(index);
                                  });
                                },
                                child:
                                Icon(CupertinoIcons.delete_simple, color: Colors.red)),

                            SizedBox(width: 0),
                            // Text(
                            //   cartprovider.cartData[index].size.toString(),
                            //   style: TextStyle(fontSize: 17),
                            // ),
                            SizedBox(
                              width: 10,

                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Quantity:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              cartprovider.cartItems[index].quantity.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                            const Spacer(),

                            const SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                        SizedBox(height: 5,),

                        Row(
                          children: [
                            const Text(
                              'Rs: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ((cartprovider.cartData[index].price)! *
                                  (cartprovider.cartItems[index].quantity)!.toInt())
                                  .toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(), // Reduced spacing between Text and Container
                            Transform.translate(
                              offset: Offset(0, -2), // Move the container up by 4 units
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2), // Reduced padding
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), // Reduced border radius
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white, // Set background color if needed
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Adjusts the container size to fit its contents
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cartprovider.decreaseQuantity(
                                            cartItemId: cartprovider.cartItems[index].sId!,
                                            context: context);
                                      },
                                      child: Icon(CupertinoIcons.minus, color: Colors.blue, size: 24), // Reduced icon size
                                    ),
                                    SizedBox(width: 6), // Reduced spacing between icons and quantity text
                                    Text(
                                      cartprovider.cartItems[index].quantity.toString(),
                                      style: TextStyle(fontSize: 17), // Reduced text size
                                    ),
                                    SizedBox(width: 6), // Reduced spacing between quantity text and plus icon
                                    InkWell(
                                      onTap: () {
                                        cartprovider.increaseQuantity(
                                            cartItemId: cartprovider.cartItems[index].sId!,
                                            context: context);
                                      },
                                      child: Icon(CupertinoIcons.add, color: Colors.blue, size: 24), // Reduced icon size
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                        ),

                  ),
                ],
              ),
            ),
          );
        },
      ),




    );
  }
}



