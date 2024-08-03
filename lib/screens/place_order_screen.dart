import 'package:ecomnode/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/smartwatchwidget.dart';

class PlaceOrderPage extends StatelessWidget {
  // double getTotalPrice() {
  //   double total = 0.0;
  //   for (var item in cartItems) {
  //     double price = double.tryParse(item['price']) ?? 0.0;
  //     int qty = (item['qty'] ?? 1) as int;
  //     total += price * qty;
  //   }
  //   return total;
  // }
  //
  // int getTotalItem() {
  //   int totalItems = 0;
  //   for (var items in cartItems) {
  //     totalItems += (items['qty'] ?? 1) as int;
  //   }
  //   return totalItems;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Place Order",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Color(0xFFF8F9FA),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Text(
      //         "Review Your Order",
      //         style: GoogleFonts.poppins(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: cartItems.length,
      //         itemBuilder: (context, index) {
      //           var item = cartItems[index];
      //           double price = double.tryParse(item['price']) ?? 0.0;
      //           int qty = (item['qty'] ?? 1) as int;
      //           return ListTile(
      //             leading: Image.asset(item['imagePath'] ?? ""),
      //             title: Text(item['name'] ?? ""),
      //             subtitle: Text("Qty: $qty"),
      //             trailing: Text("Rs ${(price * qty).toStringAsFixed(2)}"),
      //           );
      //         },
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Total Items",
      //             style: GoogleFonts.poppins(
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Text(
      //             "${getTotalItem()}",
      //             style: GoogleFonts.poppins(),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Total Price",
      //             style: GoogleFonts.poppins(
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Text(
      //             "Rs ${getTotalPrice().toStringAsFixed(2)}",
      //             style: GoogleFonts.poppins(),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 20),
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: SizedBox(
      //         width: double.infinity,
      //         height: 40,
      //         child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.blue,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //           ),
      //           onPressed: () {
      //             // Implement your order placement logic here
      //             // For now, let's just navigate back
      //             Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(totalAmount: getTotalPrice(),),));
      //           },
      //           child: Text(
      //             'Place Order',
      //             style: GoogleFonts.poppins(
      //               color: Colors.white,
      //               fontWeight: FontWeight.w600,
      //               fontSize: 16,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
