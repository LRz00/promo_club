import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/shop.dart';

class FirestoreService{

  final CollectionReference stores = FirebaseFirestore.instance.collection('stores');

  Future<void> addStore(Shop shop) async{
      try {
      // Converte o objeto Shop para um mapa
      Map<String, dynamic> shopData = shop.toMap();
      
      // Adicione o mapa ao Firestore
      await stores.add(shopData);
    } catch (e) {
      print('Failed to add store: $e');
    }
  }
}
