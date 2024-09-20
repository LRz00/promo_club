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

    Future<List<Shop>> getAllStores() async {
    try {
      QuerySnapshot snapshot = await stores.get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Shop.fromMap({...data, 'id': doc.id});
      }).toList();
    } catch (e) {
      print('Failed to get stores: $e');
      return [];
    }
  }

   Future<void> deleteStore(String id) async {
    try {
      await stores.doc(id).delete();
    } catch (e) {
      print('Failed to delete store: $e');
    }
  }


}
