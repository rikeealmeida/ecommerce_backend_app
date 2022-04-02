import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final DateTime createdAt;
  final bool isCancelled;
  Order({
    this.isCancelled,
    this.id,
    this.customerId,
    this.productIds,
    this.deliveryFee,
    this.subtotal,
    this.total,
    this.isAccepted,
    this.isDelivered,
    this.createdAt,
  });

  Order copyWith({
    int id,
    int customerId,
    List productIds,
    double deliveryFee,
    double subtotal,
    double total,
    bool isAccepted,
    bool isDelivered,
    DateTime createdAt,
    bool isCancelled,
  }) {
    return Order(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        productIds: productIds ?? this.productIds,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        subtotal: subtotal ?? this.subtotal,
        total: total ?? this.total,
        isAccepted: isAccepted ?? this.isAccepted,
        isDelivered: isDelivered ?? this.isDelivered,
        createdAt: createdAt ?? this.createdAt,
        isCancelled: isCancelled ?? this.isCancelled);
  }

  Map<String, dynamic> toMap() {
    return {
      'isCancelled': isCancelled,
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'deliveryFee': deliveryFee,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snapshot) {
    return Order(
      isCancelled: snapshot['isCancelled'],
      id: snapshot['id']?.toInt() ?? 0,
      customerId: snapshot['customerId'],
      productIds: snapshot['productIds'],
      deliveryFee: snapshot['deliveryFee']?.toDouble() ?? 0.0,
      subtotal: snapshot['subtotal']?.toDouble() ?? 0.0,
      total: snapshot['total']?.toDouble() ?? 0.0,
      isAccepted: snapshot['isAccepted'] ?? false,
      isDelivered: snapshot['isDelivered'] ?? false,
      createdAt: snapshot['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      isAccepted,
      isDelivered,
      createdAt,
      isCancelled,
    ];
  }

  static List<Order> orders = [
    Order(
      isCancelled: false,
      id: 1,
      customerId: 2345,
      productIds: ["1", "2"],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      createdAt: DateTime.now(),
    ),
    Order(
      isCancelled: false,
      id: 2,
      customerId: 245,
      productIds: ["1", "2", "3"],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      createdAt: DateTime.now(),
    ),
  ];
}
