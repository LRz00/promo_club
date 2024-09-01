import 'package:flutter/material.dart';

class StoresListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 8, // Número de lojas (pode ser dinâmico)
          itemBuilder: (context, index) {
            return _buildStoreCard(index + 1, context);
          },
        ),
      ),
    );
  }

  Widget _buildStoreCard(int storeNumber, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color(0xFFDCE2A3), // Cor de fundo dos cards das lojas
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            storeNumber.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF014C63),
        ),
        title: Text('Loja $storeNumber'),
        subtitle: Text('Endereço da Loja $storeNumber'),
      ),
    );
  }
}
