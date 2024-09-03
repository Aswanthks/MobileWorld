import 'package:ecomnode/screens/pay_sucess.dart';
import 'package:flutter/material.dart';

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

  TextEditingController _upiIdController = TextEditingController();
  TextEditingController _creditCardNumberController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addressController.text;
    total = widget.totalAmount ?? 0;
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
          "Place Order",
          style: TextStyle(
            fontSize: 21,
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
              Text(
                "Delivery Address",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 0),
              ListTile(
                title: Text(""),
                subtitle: Text(
                  _addressController.text.isEmpty ? 'Add your address' : _addressController.text,
                  style: TextStyle(
                    color: _addressController.text.isEmpty ? Colors.grey : Colors.black,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    _showAddressDialog();
                  },
                  child: Text(
                    "Change",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Divider(),
              Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
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
                  'Paytm',
                  'Cash on Delivery',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontStyle: FontStyle.italic, // Makes the text italic
                      ),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Payment Method',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25),

              if (_selectedPaymentMethod == 'Gpay')
                TextField(
                  controller: _upiIdController,
                  decoration: InputDecoration(
                    labelText: 'Enter UPI ID',
                    border: OutlineInputBorder(),
                  ),
                ),
              if (_selectedPaymentMethod == 'Debit Card')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _creditCardNumberController,
                      decoration: InputDecoration(
                        labelText: 'Debit Card Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              if (_selectedPaymentMethod == 'Paytm')
                TextField(
                  controller: _upiIdController,
                  decoration: InputDecoration(
                    labelText: 'Enter UPI ID',
                    border: OutlineInputBorder(),
                  ),
                ),
              if (_selectedPaymentMethod == 'Cash on Delivery')
                Text('No additional details required'),
              SizedBox(height: 20),
              Divider(),
              Text(
                "Total Amount",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 0),
              ListTile(
                title: Text(
                  "Rs ${widget.totalAmount.toStringAsFixed(2)}",
                  style: TextStyle(),
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
                    _showPaymentSuccessDialog();

                    // Optionally navigate to another screen or handle payment confirmation here
                  },
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(
                      color: Colors.white,

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
