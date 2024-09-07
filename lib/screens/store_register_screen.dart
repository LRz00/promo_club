import 'package:flutter/material.dart';
import 'package:promo_club/entity/shop.dart';
import 'package:promo_club/services/firestore.dart';

class RegisterStoreScreen extends StatefulWidget {
  @override
  _RegisterStoreScreenState createState() => _RegisterStoreScreenState();
}

class _RegisterStoreScreenState extends State<RegisterStoreScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _selectedRegion = 'Irecê, BA';

  final FirestoreService _firestoreService = FirestoreService();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/PromoClub1.png', // Caminho do logo
              height: 80,
            ),
            const SizedBox(height: 24),
            _buildTextField('Nome:', 'Loja Almeida', _nameController),
            const SizedBox(height: 16),
            _buildTextField('Proprietário:', 'João Souza', _ownerController),
            const SizedBox(height: 16),
            _buildTextField('CNPJ:', '00.123.456/0001-23', _cnpjController),
            const SizedBox(height: 16),
            _buildDropdownField(
              'Região:', 
              ['Irecê, BA', 'Barra do Mendes', 'Outros'],
              (newValue) {
                setState(() {
                  _selectedRegion = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildTextField('Endereço:', 'Rua, Número, Bairro', _addressController),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _addStore();
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

  Widget _buildTextField(String label, String hintText, TextEditingController controller, {bool obscureText = false}) {
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
          controller: controller,
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

  Widget _buildDropdownField(String label, List<String> options, ValueChanged<String?> onChanged) {
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
          value: _selectedRegion,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
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

  void _addStore() {
    // Crie uma instância de Shop
    Shop shop = Shop(
      id: DateTime.now().millisecondsSinceEpoch, // ID único
      name: _nameController.text,
      owner: _ownerController.text,
      cnpj: _cnpjController.text,
      region: _selectedRegion,
      address: _addressController.text,
    );

    // Chame a função addStore do FirestoreService
    _firestoreService.addStore(shop).then((_) {
      // Mostre uma mensagem de sucesso ou navegue para outra tela
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Loja cadastrada com sucesso!')),
      );
    }).catchError((error) {
      // Mostre uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao cadastrar loja: $error')),
      );
    });
  }
}
