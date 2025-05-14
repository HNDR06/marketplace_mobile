import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:marketplace_mobile/pages/home/chat_page.dart';
// import 'package:marketplace_mobile/pages/home/home_page.dart';
// import 'package:marketplace_mobile/pages/home/profile_page.dart';
// import 'package:marketplace_mobile/pages/home/wishlist_page.dart';
// import 'package:marketplace_mobile/providers/page_provider.dart';
import 'package:marketplace_mobile/theme.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_cart.png', 
          width: 20,)
        );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),

          child: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Image.asset(
              'assets/icon_home.png',
              width: 21,
              ), label: ''),
            BottomNavigationBarItem(icon: Image.asset(
              'assets/icon_chat.png',
              width: 21,  
              ), label: ''),
            BottomNavigationBarItem(icon: Image.asset(
              'assets/icon_profile.png',
              width: 21,
              ), label: ''),
            BottomNavigationBarItem(icon: Image.asset(
              'assets/icon_wishlist.png',
              width: 21,
              ), label: ''),
          ],
          backgroundColor: backgroundColor3,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          elevation: 0,
          currentIndex: 0,
            ),
      );
    }
    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  
      bottomNavigationBar: customBottomNav(),
      body: Center(
        child: Text('Main Page')),
    );
  }
}