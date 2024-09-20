import 'package:flutter/material.dart';
import 'package:promo_club/entity/shop.dart';
import 'package:promo_club/services/firestore.dart';

class StoresListScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Shop>>(
          future: _firestoreService.getAllStores(), // Busca as lojas do Firestore
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar lojas'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Nenhuma loja encontrada'));
            }

            final stores = snapshot.data!;

            return ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                return _buildStoreCard(stores[index], context);
              },
            );
          },
        ),
      ),
    );
  }

 Widget _buildStoreCard(Shop shop, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color(0xFFDCE2A3), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            shop.name.substring(0, 1), // Primeira letra do nome da loja
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF014C63),
        ),
        title: Text(shop.name), // Nome da loja vindo do Firestore
        subtitle: Text(shop.address), // Endereço da loja vindo do Firestore
      ),
    );
  }
}
