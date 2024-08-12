import 'package:ecomnode/admin/homeviewmodel.dart';
import 'package:ecomnode/screens/home_page.dart';
import 'package:ecomnode/screens/signup_page.dart';
import 'package:ecomnode/viewmodel/auth_viewmodel.dart';
import 'package:ecomnode/viewmodel/cart_view_model.dart';
import 'package:ecomnode/viewmodel/favourite_view_model.dart';
import 'package:ecomnode/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>authviewmodel() ,),
      ChangeNotifierProvider(create: (_) =>ProductViewModel() ,),

      ChangeNotifierProvider(create: (_) =>CartViewModel(),),
      ChangeNotifierProvider(create: (context) => FavoriteViewModel()),



    ],
  child:
      MaterialApp(debugShowCheckedModeBanner: false,
      home:signuppage()
  )));
}

