import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfile1 extends StatefulWidget {
  @override
  _ViewProfile1State createState() => _ViewProfile1State();
}

class _ViewProfile1State extends State<ViewProfile1> {
  final TextEditingController _nameController = TextEditingController(text: 'Aswanth');
  final TextEditingController _emailController = TextEditingController(text: 'aswanth@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '9898989898');

  bool _isEditing = false;

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      title: const Row(
        children: [

          Text(
            'View Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ],
      ),
    ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/image/profileavatar.jpg'),
              ),
              SizedBox(height: 20),
              _isEditing
                  ? TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              )
                  : Text(
                _nameController.text,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _isEditing
                  ? TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              )
                  : Text(
                _emailController.text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10),
              _isEditing
                  ? TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              )
                  : Text(
                _phoneController.text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_isEditing) {
                    // Save changes
                    // For example, you might want to save the data to a server or local storage
                  }
                  _toggleEdit();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    _isEditing ? "Save Changes" : "Edit Profile",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
