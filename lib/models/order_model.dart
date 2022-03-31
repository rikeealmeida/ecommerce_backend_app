import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final DateTime createdAt;
  Order({
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
    List<Int> productIds,
    double deliveryFee,
    double subtotal,
    double total,
    bool isAccepted,
    bool isDelivered,
    DateTime createdAt,
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
      id: snapshot['id']?.toInt() ?? 0,
      customerId: snapshot['customerId'],
      productIds: snapshot['productIds'],
      deliveryFee: snapshot['deliveryFee']?.toDouble() ?? 0.0,
      subtotal: snapshot['subtotal']?.toDouble() ?? 0.0,
      total: snapshot['total']?.toDouble() ?? 0.0,
      isAccepted: snapshot['isAccepted'] ?? false,
      isDelivered: snapshot['isDelivered'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(snapshot['createdAt']),
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
    ];
  }

  static List<Order> orders = [
    Order(
      id: 1,
      customerId: 2345,
      productIds: [1, 2],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      createdAt: DateTime.now(),
    ),
    Order(
      id: 2,
      customerId: 245,
      productIds: [1, 2, 3],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      createdAt: DateTime.now(),
    ),
  ];
}
