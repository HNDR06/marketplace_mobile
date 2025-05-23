import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:marketplace_mobile/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState() {

    Timer(
      Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/sign-in'),
    );

    super.initState();
  }

  // getInit() async {
  //   // await Provider.of<ProductProvider>(context, listen: false).getProducts();
  //   Navigator.pushNamed(context, '/sign-in');
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
