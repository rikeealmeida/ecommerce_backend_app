import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_manager/models/order_model.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Pedidos"),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: Order.orders.length,
            itemBuilder: (BuildContext context, int index) {
              return OrderCard(order: Order.orders[index]);
            },
          ),
        ),
      ]),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({
    Key key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID do pedido: ${order.id}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('dd-MM-yy').format(order.createdAt),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
