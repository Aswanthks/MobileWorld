

import 'package:ecomnode/model/auth_model.dart';
import 'package:ecomnode/screens/signinpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/auth_viewmodel.dart';


class signuppage extends StatefulWidget {


  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3f03c64),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              // SizedBox(
              //   height: 50,
              // ),
              // Image.asset('assets/image/logo-white.png', height: 150, width: 150),
              // SizedBox(
              //   height: 16,
              // ),
              SizedBox(height: 80,),
              Text(
                "Signup",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'name',
                  prefixIcon: Icon(Icons.account_box, color: Colors.pink),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email, color: Colors.pink),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.email, color: Colors.pink),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Phoneno',
                  prefixIcon: Icon(Icons.email, color: Colors.pink),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.pink),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              Container(
                width: 400,
                child:
                Consumer<authviewmodel>(builder:(context, value, child) => value.loading?Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      value.Registration(auth: authmodel(email: emailController.text,
                          name:nameController.text,password: passwordController.text
                        ,phone: phoneController.text,username: usernameController.text
                      ),
                          context: context);


                    },
                    child: Text('Signup',
                        style: TextStyle(color: Colors.pink, fontSize: 18)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(


                icon: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png', // Replace with a local asset or correct URL if necessary
                  width: 40,
                  height: 40,
                ),
                label: Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  minimumSize:
                  Size(500, 60), // Set the minimum size (width, height)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                ), onPressed: () {  },
              ),
              SizedBox(height: 20,),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already Have An Account? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                            // Handle sign in navigation
                          },
                      ),
                    ],
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
