import 'package:flutter/material.dart';

class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2A3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2A3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: SingleChildScrollView(  // Solução para evitar overflow
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/PromoClub1.png', // Caminho do logo
              height: 80,
            ),
            const SizedBox(height: 24),
            _buildTextField('Email:', 'user@email.com'),
            const SizedBox(height: 16),
            _buildTextField('Nome:', 'João Souza'),
            const SizedBox(height: 16),
            _buildTextField('CPF:', '123.456.789-10'),
            const SizedBox(height: 16),
            _buildDropdownField(
                'Região:', ['Irecê, BA', 'Barra do Mendes', 'Outros']),
            const SizedBox(height: 16),
            _buildTextField('Filiação:', 'Xxxxxxxx'),
            const SizedBox(height: 16),
            _buildTextField('Senha:', '*****', obscureText: true),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Ação de cadastro
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF014C63),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'CADASTRAR',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> options) {
    String selectedValue = options.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            selectedValue = newValue!;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

