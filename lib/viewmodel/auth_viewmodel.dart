import 'dart:ffi';

import 'package:ecomnode/model/auth_model.dart';
import 'package:ecomnode/screens/home_page.dart';
import 'package:ecomnode/screens/signinpage.dart';
import 'package:ecomnode/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class authviewmodel extends ChangeNotifier {
  bool loading = false;
  final authservicess = Authserrvices();

  Future<void> Registration(
      {required authmodel auth, required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();
      await authservicess.register(auth: auth);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Register successful")));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("AN error occured")));
    }finally{loading = false;
    notifyListeners();}
  }

  Future<void> login(
      {required email,
        required password,
        required BuildContext context,}) async {
    try {
      loading = true;
      notifyListeners();
      await authservicess.login(email: email, password: password);

      loading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );

      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      loading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred while logiin: $e')),
      );
    }
  }
}
