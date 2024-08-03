//
// import 'package:ecomnode/viewmodel/product_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// import '../model/product_model.dart';
//
//
// List<Map<String, dynamic>> cartItems = [];
//
// class productsdetails extends StatefulWidget {
//   final Productmodel product;
//   const productsdetails({
//     Key? key,
//
//     required this.product, required BuildContext context,
//   }) : super(key: key);
//
//   @override
//   State<productsdetails> createState() => _productsdetailsState();
// }
//
//
// class _productsdetailsState extends State<productsdetails> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductViewModel>(
//       builder: (context, value, child) {
//         if (value.loading) {
//           return CircularProgressIndicator();
//         }
//         return
//           Container(
//             height: 340,
//             width: 160,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   ClipRRect(
//
//                     borderRadius: BorderRadius.circular(25),
//
//                     child: Image.network(
//                       widget.product.imagePath,
//                       height: 180,
//                       width: 200,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Icon(
//                       Icons.favorite,
//                       color: Colors.red,
//                       size: 24.0,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       color: Colors.white,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 15, right: 10),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             SizedBox(height: 0),
//                             Text(
//                               widget.product.price,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               widget.product.name,
//                               style: TextStyle(fontSize: 13),
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Implement your Buy Now functionality here
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 37),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     backgroundColor: Colors.blue,
//                                   ),
//                                   child: Text(
//                                     'Buy Now',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     cartItems.add(widget.product as Map<String,
//                                         dynamic>); // Add product to cartItems
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         content: Text('Item added to cart!'),
//                                       ),
//                                     );
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 30),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     backgroundColor: Colors.blue,
//                                   ),
//                                   child: Text(
//                                     'Add to Cart',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//       });
//   }
// }
