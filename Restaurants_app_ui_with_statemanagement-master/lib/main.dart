

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restroapp/intropage.dart';
import 'package:restroapp/screens/cart_page.dart';
import 'package:restroapp/screens/menu_page.dart';
import 'package:restroapp/screens/shop.dart';
void main(){
  runApp(
      ChangeNotifierProvider(create: (context)=>Shop(),
        child:  (const MyApp()),

      )
  );
      }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const IntroPage(),
      routes: {
        '/intropage':(context)=>const IntroPage(),
        '/menupage' : (context)=> const MenuPage(),
        '/cart': (context)=>const CartPage(),
      },
    );
  }
}

