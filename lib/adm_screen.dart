import 'package:flutter/material.dart';
import 'package:promo_club/register_user_screen.dart';
import 'package:promo_club/store_register_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2A3), // Fundo da tela
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/PromoClub1.png', // Caminho do logo
                height: 80,
              ),
              const SizedBox(height: 32),
              const Text(
                'Bem Vindo, Administrador.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF014C63),
                ),
              ),
              const SizedBox(height: 48),
              _buildActionButton(
                context,
                'CADASTRAR USUARIO',
                const Color(0xFF014C63),
                () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterUserScreen(),),
                      );
                },
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                context,
                'CADASTRAR COMERCIO',
                const Color(0xFF014C63),
                () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterStoreScreen(),),
                      );
                },
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                context,
                'DELETAR COMERCIO',
                const Color(0xFF014C63),
                () {
                  // Ação ao clicar em Deletar Comércio
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Cor do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
