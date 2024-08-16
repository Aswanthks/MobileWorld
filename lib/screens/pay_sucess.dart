import 'package:flutter/material.dart';

class PaymentSuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 24),
                Icon(Icons.check_circle, color: Colors.green, size: 64),
                SizedBox(height: 24),
                Text(
                  'Payment Successful',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Thank you for your payment!',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).pop(); // Close the dialog
                //     Navigator.of(context).pop(); // Close the PaymentPage
                //   },
                //   child: Text(
                //     'OK',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
