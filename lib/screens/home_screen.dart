import 'package:flutter/material.dart';
import 'package:promo_club/screens/login_screen.dart';
import 'package:promo_club/screens/request_account_screen.dart';
import 'package:promo_club/screens/adm_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF014C63), // Cor de fundo (azul esverdeado)
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/PromoClub2.png', 
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,      
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.white, // Linha divisória branca
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen(),),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA9B559), // Cor do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                    ),
                    child: const Text(
                      'LOGIN', 
                      style: TextStyle(color: Colors.white),    
                  ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width:double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RequestAccountScreen(),),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA9B559), // Cor do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                    ),
                    child: const Text('SOLICITAR CADASTRO', 
                      style: TextStyle(color: Colors.white), ),
                  ),
                ),
                const SizedBox(height: 10),
              
              TextButton(
                onPressed: () {
                       Navigator.push(
                         context,
                        MaterialPageRoute(builder: (context) =>  AdminScreen(),),
                      );
                },
                child: const Text(
                  'Administrador?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
