import 'package:flutter/material.dart';
import 'package:ecomnode/screens/signup_page.dart';
import 'package:ecomnode/screens/chatbot_page.dart';
import 'package:ecomnode/screens/profile_details.dart';
import 'package:ecomnode/widgets/cart_widget.dart';

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
                fontSize: 21,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10), // Space between sections

          // Account Settings section title
          _buildSectionTitle('Account Settings'),
          // Account Settings section box
          _buildSectionBox(
            [
              _buildListTile(
                'My Profile',
                textSize: 16, // Custom text size
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewProfile1()), // Navigate to ViewProfile1
                  );
                },
              ),
              _buildListTile('Your Addresses', textSize: 16),
              _buildListTile('Manage Your Account', textSize: 16),
              _buildListTile(
                'Chatbot',
                textSize: 16,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()), // Navigate to ChatScreen
                  );
                },
              ),
              _buildListTile(
                'Logout',
                textSize: 16,
                color: Colors.red, // Custom text color for Logout
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signuppage()), // Navigate to signuppage
                  );
                },
              ),
            ],
          ),
          // Orders section title
          _buildSectionTitle('Orders'),
          // Orders section box
          _buildSectionBox(
            [
              _buildListTile(
                'Your Orders',
                textSize: 16,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()), // Navigate to CartScreen
                  );
                },
              ),
              _buildListTile(' Saved', textSize: 16),

            ],
          ),
        ],
      ),
    );
  }

  // Function to build a section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }

  // Function to build a section with a list of tiles
  Widget _buildSectionBox(List<Widget> tiles) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: tiles.asMap().entries.map((entry) {
          int index = entry.key;
          Widget tile = entry.value;

          // Determine if the current tile is the last in the list
          bool isLast = index == tiles.length - 1;

          return Column(
            children: [
              tile,
              if (!isLast) Divider(height: 1, thickness: 1), // Show divider if not last
            ],
          );
        }).toList(),
      ),
    );
  }

  // Function to build a list tile with customizable text size and color
  Widget _buildListTile(
      String title, {
        VoidCallback? onTap,
        double textSize = 14,
        Color color = Colors.black, // Default color is black
      }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          color: color, // Apply the custom text color
        ),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap ?? () {
        // Handle default tap
      },
    );
  }
}
