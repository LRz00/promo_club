import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2A3), 
            body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/PromoClub1.png', // Coloque o caminho correto da imagem
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildCategoryCard('Mercados', Icons.store_mall_directory),
                    _buildCategoryCard('Agropecuaria', Icons.agriculture),
                    _buildCategoryCard('Construção', Icons.construction),
                    _buildCategoryCard('Eletrônicos', Icons.devices),
                    _buildCategoryCard('Farmacia', Icons.local_pharmacy),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }

     Widget _buildCategoryCard(String title, IconData icon) {
    return Container(
      width: 160, // Ajuste a largura para ser responsiva
      height: 100,
      child: Card(
        color: Color(0xFFD2D6A6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}