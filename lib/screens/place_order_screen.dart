// import 'package:ecomnode/screens/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class PlaceOrderPage extends StatefulWidget {
//   final double totalAmount;
//
//   const PlaceOrderPage({Key? key, required this.totalAmount}) : super(key: key);
//
//   @override
//   _PlaceOrderPageState createState() => _PlaceOrderPageState();
// }
//
// class _PlaceOrderPageState extends State<PlaceOrderPage> {
//   TextEditingController _addressController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize with any default address if needed
//     _addressController.text = "Default Address";
//   }
//
//   void _showAddressDialog() {
//     TextEditingController _editAddressController = TextEditingController(text: _addressController.text);
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Address'),
//           content: TextField(
//             controller: _editAddressController,
//             decoration: InputDecoration(hintText: 'Enter your address'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Save'),
//               onPressed: () {
//                 setState(() {
//                   _addressController.text = _editAddressController.text;
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showOrderSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Order Placed Successfully'),
//           content: Text('Your order has been placed successfully!'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           "Place Order",
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//         elevation: 0.5,
//       ),
//       backgroundColor: Color(0xFFF8F9FA),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Delivery Address",
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               ListTile(
//                 title: Text(""),
//                 subtitle: Text(
//                   _addressController.text.isEmpty ? 'Add your address' : _addressController.text,
//                   style: TextStyle(
//                     color: _addressController.text.isEmpty ? Colors.grey : Colors.black,
//                   ),
//                 ),
//                 trailing: TextButton(
//                   onPressed: () {
//                     _showAddressDialog();
//                   },
//                   child: Text(
//                     "Change",
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ),
//               Divider(),
//               Text(
//                 "Total Amount",
//                 style: GoogleFonts.poppins(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               ListTile(
//                 title: Text(
//                   "Rs ${widget.totalAmount.toStringAsFixed(2)}",
//                   style: GoogleFonts.poppins(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 height: 40,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     _showOrderSuccessDialog();
//                     Future.delayed(Duration(seconds: 2), () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)); // Go back to the previous screen
//                     });
//                   },
//                   child: Text(
//                     'Place Order',
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
