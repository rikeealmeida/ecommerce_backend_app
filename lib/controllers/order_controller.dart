import 'package:flutter_ecommerce_manager/services/database_service.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendindOrders());
    super.onInit();
  }

  void updateOrder(Order order, String field, bool value) {
    database.updateOrder(order, field, value);
  }
}
