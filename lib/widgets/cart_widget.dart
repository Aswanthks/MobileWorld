
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.pinkAccent),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        cartprovider.cartData[index].image ?? 'image'),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
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
                            Text(
                              'Size: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                              'Qty:',
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
                            InkWell(
                              onTap: () {
                                cartprovider.decreaseQuantity(
                                    cartItemId:
                                    cartprovider.cartItems[index].sId!,
                                    context: context);
                              },
                              child: Icon(Icons.remove_circle,
                                  color: Colors.blue),
                            ),
                            const SizedBox(width: 25),
                            InkWell(
                              onTap: () {
                                cartprovider.increaseQuantity(
                                    cartItemId:
                                    cartprovider.cartItems[index].sId!,
                                    context: context);
                              },
                              child:
                              Icon(Icons.add_circle, color:Colors.blue),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              '\$: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ((cartprovider.cartData[index].price)! *
                                  (cartprovider.cartItems[index].quantity)!
                                      .toInt())
                                  .toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            const Spacer(),
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
                              const Icon(Icons.delete, color: Colors.red),
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        ),
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
