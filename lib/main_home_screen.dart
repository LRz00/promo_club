import 'package:flutter/material.dart';
import 'package:promo_club/categories_screen.dart';
import 'package:promo_club/profile_screen.dart';
import 'package:promo_club/stores_list_screen.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    StoresListScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2A3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF014C63),
        title: Image.asset(
          'images/PromoClub2.png', // Coloque o caminho correto do logo
          height: 40,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Lógica de busca será implementada aqui
            },
          ),
        ],
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            label: 'Lojas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
