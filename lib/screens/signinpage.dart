

import 'package:ecomnode/screens/signup_page.dart';
import 'package:ecomnode/viewmodel/auth_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3f03c64),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100),

                SizedBox(height: 20),
                Text("Login",style: TextStyle(color: Colors.white,fontSize: 20)),
                SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.pink),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.pink),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                Consumer<authviewmodel>(
                  builder: (context, value, child) => value.loading
                      ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ): ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () { if (_formKey.currentState!.validate()) {
                      value.login(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context);
                    }

                    },
                    child: Text('Login', style: TextStyle(color: Colors.pink)),
                  ),
                ),
                SizedBox(height: 14),
                Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'Sign Up for free',
                        style: TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signuppage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
