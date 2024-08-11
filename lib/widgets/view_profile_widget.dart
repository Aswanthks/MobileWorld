import 'package:ecomnode/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/auth_viewmodel.dart';

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<authviewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
           IconButton(
             icon: Icon(Icons.logout),
             onPressed: () {
              // Call logout method from view model
       Navigator.push(context, MaterialPageRoute(builder:(context) => signuppage(),));
            },
          ),
         ],
       ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Name: ${authViewModel.user?.name ?? "N/A"}',
            //   style: TextStyle(fontSize: 18),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   'Email: ${authViewModel.user?.email ?? "N/A"}',
            //   style: TextStyle(fontSize: 18),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   'Username: ${authViewModel.user?.username ?? "N/A"}',
            //   style: TextStyle(fontSize: 18),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   'Phone: ${authViewModel.user?.phone ?? "N/A"}',
            //   style: TextStyle(fontSize: 18),
            // ),
            // Add more profile details as needed
          ],
        ),
      ),
    );
  }
}
