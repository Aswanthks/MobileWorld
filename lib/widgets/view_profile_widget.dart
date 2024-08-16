import 'package:ecomnode/screens/chatbot_page.dart';
import 'package:ecomnode/screens/profile_details.dart';
import 'package:ecomnode/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/auth_viewmodel.dart';

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        title: const Row(
          children: [
            SizedBox(width: 20),
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
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

            Column(
              children: <Widget>[
                Divider(
                  color: Colors.black12,
                  thickness: 1.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0), // Reduced margin
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjusted padding
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  width: 300.0, // Set a fixed width for the container
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewProfile1()), // Navigate to the current profile page
                      );
                    },
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20),

            Column(
              children: <Widget>[
                Divider(
                  color: Colors.black12,
                  thickness: 1.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0), // Reduced margin
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjusted padding
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  width: 300.0, // Set a fixed width for the container
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()), // Navigate to ChatScreen
                      );
                    },
                    child: Text(
                      'Chat with Bot',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black12,
                  thickness: 1.0,
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
