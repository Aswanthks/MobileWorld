import 'package:ecomnode/screens/logopage.dart';
import 'package:ecomnode/screens/signup_page.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogoPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/image/spla4.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     "OXY BOOTS",
          //     style: TextStyle(
          //       fontFamily: "airbnb",
          //       color: Colors.white,
          //       fontWeight: FontWeight.normal,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
