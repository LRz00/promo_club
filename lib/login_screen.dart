import 'package:flutter/material.dart';
import 'package:promo_club/main_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF014C63), // Cor de fundo (azul esverdeado)
      appBar: AppBar(
        backgroundColor: const Color(0xFF014C63),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/PromoClub2.png', // Certifique-se de adicionar o arquivo na pasta assets
                height: 150,
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.white, // Linha divisória branca
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(height: 20),
              // Campo de Email
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email:',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              // Campo de Senha
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha:',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botão de Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica de login
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  MainHomeScreen(),),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA9B559), // Cor do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white), // Texto branco
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Esqueceu a Senha?
              TextButton(
                onPressed: () {
                  // Lógica para "Esqueceu a senha?"
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
