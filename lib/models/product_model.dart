import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String description;
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  double price;
  final bool isRecommended;
  final bool isPopular;
  int quantity;

  Product({
    this.description,
    this.quantity = 0,
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.price = 0,
    this.isRecommended,
    this.isPopular,
  });

  @override
  List<Object> get props => [
        id,
        description,
        quantity,
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  Product copyWith({
    String description,
    String id,
    String name,
    String category,
    String imageUrl,
    double price,
    bool isRecommended,
    bool isPopular,
    int quantity,
  }) {
    return Product(
      description: description ?? description,
      id: id ?? id,
      name: name ?? name,
      category: category ?? category,
      imageUrl: imageUrl ?? imageUrl,
      price: price ?? price,
      isRecommended: isRecommended ?? isRecommended,
      isPopular: isPopular ?? isPopular,
      quantity: quantity ?? quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
      id: snapshot['id'],
      name: snapshot['name'],
      category: snapshot['category'],
      description: snapshot['description'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
      quantity: snapshot['quantity'],
    );
  }
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Product> products = [
    // modelo para cosméticos
    Product(
      id: "1",
      name: "Eau de Parfum",
      category: "Cosméticos",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://a-static.mlcdn.com.br/618x463/la-vie-est-belle-lancome-perfume-feminino-eau-de-parfum/epocacosmeticos-integra/7172/76af36cb71c8bc2f73097a5a82a863bf.jpg",
      quantity: 10,
      price: 10.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: "2",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      name: "Irresistible",
      category: "teste",
      imageUrl: "https://fraguru.com/mdimg/perfume/375x500.60891.jpg",
      quantity: 5,
      price: 10.79,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: "3",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      name: "Saint Lauren",
      category: "Cosméticos",
      imageUrl:
          "https://epocacosmeticos.vteximg.com.br/arquivos/ids/375812-500-500/libre-yves-saint-laurent-perfume-feminino-eau-de-parfum-30ml.jpg?v=637188594756430000",
      quantity: 8,
      price: 2.59,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: "4",
      name: "My Way",
      category: "Cosméticos",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://epocacosmeticos.vteximg.com.br/arquivos/ids/424461-500-500/my-way-giorgio-armani-perfume-feminino-edp-30ml.jpg?v=637515094182500000",
      quantity: 10,
      price: 5.90,
      isRecommended: true,
      isPopular: true,
    ),
    // modelo para moda masculina
    Product(
      id: "5",
      name: "Camisa Branca",
      category: "Moda Masculina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://rlv.zcache.com.br/camisa_branca_lisa-rd31aff54d37c459ca43401eedbf54e07_k2gr0_540.jpg",
      price: 15.90,
      quantity: 2,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: "6",
      name: "Camisa Preta",
      category: "Moda Masculina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://cf.shopee.com.br/file/71ad80f1c46275424f2f84cbe421537c",
      price: 13.99,
      quantity: 20,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: "7",
      name: "Jaqueta Jeans",
      category: "Moda Masculina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://lojasgang.vteximg.com.br/arquivos/ids/289158/34200091-JAQUETA-JEANS-BLUE-MEDIO-RASGOS-1.jpg?v=637514962528930000",
      quantity: 1,
      price: 25.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: "8",
      name: "Calça Jeans",
      category: "Moda Masculina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://cf.shopee.com.br/file/fed19a35eb976e8d0a7cc92193915660",
      quantity: 12,
      price: 33.99,
      isRecommended: true,
      isPopular: false,
    ),
    // modelo para moda feminina
    Product(
      id: "9",
      name: "Cropped Preto",
      category: "Moda Feminina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://cf.shopee.com.br/file/56f9412ee0c951e5530e297c6289cb26",
      quantity: 20,
      price: 15.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: "10",
      name: "Calça Xadrez",
      category: "Moda Feminina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://a-static.mlcdn.com.br/618x463/calca-xadrez-feminina-jogger-bengaline-preta-tamanho-p-machete-moda-feminina/machetemodafeminina/8dbaa6fa487711ebadfb4201ac1850d0/b7b236e7c4f9b28104e76f23d2cb7b8c.jpeg",
      quantity: 5,
      price: 8.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: "11",
      name: "Vestido com babados",
      category: "Moda Feminina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://m.media-amazon.com/imageUrl/I/61KRGkTLDRL._AC_SX342_.jpg",
      quantity: 30,
      price: 5.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: "12",
      name: "Blusa rosa com babados",
      category: "Moda Feminina",
      description:
          '  description: description ?? description,id: id ?? id, name: name ?? name',
      imageUrl:
          "https://ozllo.vteximg.com.br/arquivos/ids/258450-1000-1263/image-5e73669eacb94376a79bc2d7c016cea1.jpg?v=637607519327270000",
      quantity: 3,
      price: 20.90,
      isRecommended: true,
      isPopular: true,
    ),
  ];
}
