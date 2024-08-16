


import 'package:ecomnode/screens/home_page.dart';
import 'package:ecomnode/screens/pay_sucess.dart';
import 'package:ecomnode/screens/place_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  final double totalAmount;

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);


  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;
  TextEditingController _addressController = TextEditingController();
  late double total = 0;

  @override
  void initState() {
    super.initState();
    _addressController.text;
    total = widget.totalAmount ?? 0;//
    // Default address
  }

  void _showAddressDialog() {
    TextEditingController _editAddressController = TextEditingController(text: _addressController.text);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Address'),
          content: TextField(
            controller: _editAddressController,
            decoration: InputDecoration(hintText: 'Enter your address'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _addressController.text = _editAddressController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PaymentSuccessDialog(); // Your custom dialog widget
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text(
          "Make Payment",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,


          ),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Delivery Address",
              //   style: GoogleFonts.poppins(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: 10),
              // ListTile(
              //   title: Text(""),
              //   subtitle: Text(
              //     _addressController.text.isEmpty ? 'Add your address' : _addressController.text,
              //     style: TextStyle(
              //       color: _addressController.text.isEmpty ? Colors.grey : Colors.black,
              //     ),
              //   ),
              //   trailing: TextButton(
              //     onPressed: () {
              //       _showAddressDialog();
              //     },
              //     child: Text(
              //       "Change",
              //       style: TextStyle(color: Colors.blue),
              //     ),
              //   ),
              // ),
        
              Divider(),
              Text(
                "Payment Method",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedPaymentMethod,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaymentMethod = newValue;
                  });
                },
                items: <String>[
                  'Gpay',
                  'Debit Card',
                  'PayPal',
                  'Cash on Delivery',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Payment Method',
                  border: OutlineInputBorder(),
                ),
              ),
              Divider(),
              Text(
                "Total Amount",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Rs ${widget.totalAmount.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Show success message
                    _showPaymentSuccessDialog();

                    // Navigate back to previous page after a delay (optional)
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrderPage(totalAmount: total),));
                    });
                  },
                  child: Text(
                    'Confirm Payment',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
