import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2A3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage('images/profile-pic.jpg'), // Caminho da imagem do perfil
            ),
            const SizedBox(height: 16),
            const Text(
              'Maria Aparecida',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoCard('CPF:', '123.456.789-10'),
            const SizedBox(height: 8),
            _buildInfoCard('E-mail:', 'user@email.com'),
            const SizedBox(height: 8),
            _buildInfoCard('Região:', 'Irecê, BA'),
            const SizedBox(height: 8),
            _buildInfoCard('Filiação:', 'Xxxx'),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Ação ao clicar no QR code
              },
              child: Image.asset(
                'images/qr-button.png', // Caminho da imagem do QR code
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String info) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFD2D6A6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              info,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

