import 'package:ecomnode/screens/chatbot_page.dart';
import 'package:ecomnode/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/auth_viewmodel.dart';


class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 // Capitalize class name

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Call logout method from view model
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => signuppage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile details - uncomment and use as needed
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

            SizedBox(height: 20), // Add some space before the buttons

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text('Chat with Bot', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProfile()), // Navigate to the current profile page
                );
              },
              child: Text('View Profile', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
