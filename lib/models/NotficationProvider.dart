import 'package:flutter/cupertino.dart';

import '../helper/api.dart';
import 'Coffe-Model.dart';

class NotificationProvider with ChangeNotifier {
  List<CoffeeModel> _deliveredOrders = [];

List<CoffeeModel> get deliveredOrders => _deliveredOrders;

int get notificationCount => _deliveredOrders.length;

Future<void> fetchDeliveredOrders() async {
  try { List<dynamic> data = await Api().get(url: 'http://localhost:9000/order/delivered-orders');
    _deliveredOrders = data.map((e) => CoffeeModel.fromJson(e)).toList(); notifyListeners(); }
  catch (e)
  { print("Error fetching delivered orders: $e"); } }
}