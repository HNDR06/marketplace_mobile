import 'package:flutter/material.dart';
import 'package:marketplace_mobile/pages/splash_page.dart';
import 'package:marketplace_mobile/pages/sign_in_page.dart';
import 'package:marketplace_mobile/pages/sign_up_page.dart';
import 'package:marketplace_mobile/pages/home/main_page.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child: Text(
        'Halo Sayang',
        style: priceTextStyle.copyWith(fontSize: 50),),
      )
      );
  }
}