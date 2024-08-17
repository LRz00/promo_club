import 'package:flutter/material.dart';
import 'package:promo_club/home_screen.dart';

void main() {
  runApp(const PromoClubApp());
}

class PromoClubApp extends StatelessWidget{
  const PromoClubApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

