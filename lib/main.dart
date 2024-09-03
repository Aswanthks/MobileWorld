
import 'package:ecomnode/screens/home_page.dart';
import 'package:ecomnode/screens/signup_page.dart';
import 'package:ecomnode/screens/splash.dart';
import 'package:ecomnode/viewmodel/auth_viewmodel.dart';
import 'package:ecomnode/viewmodel/cart_view_model.dart';
import 'package:ecomnode/viewmodel/favourite_view_model.dart';
import 'package:ecomnode/viewmodel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>authviewmodel() ,),
      ChangeNotifierProvider(create: (_) =>ProductViewModel() ,),

      ChangeNotifierProvider(create: (_) =>CartViewModel(),),
      ChangeNotifierProvider(create: (context) => FavoriteViewModel()),



    ],
  child:
      MaterialApp(debugShowCheckedModeBanner: false,
      home:Splash()
  )));
}

