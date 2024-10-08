import 'dart:core';

class Shop{
    final int id;
    final String name;
    final String owner;
    final String cnpj;
    final String region;
    final String address;
    final String category;

  Shop({
    required this.id,
    required this.name,
    required this.owner,
    required this.cnpj,
    required this.region,
    required this.address,
    required this.category
  });

  factory Shop.fromMap(Map<String, dynamic> map){
    return Shop(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      owner: map['owner'] ?? '',
      cnpj: map['cnpj'] ?? '',
      region: map['region'] ?? '',
      address: map['address'] ?? '',
      category: map['category'] ?? ''
    );
  }   

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name' : name,
      'owner': owner,
      'cnpj': cnpj,
      'region': region,
      'address': address,
      'category': category
    };
  }
}
