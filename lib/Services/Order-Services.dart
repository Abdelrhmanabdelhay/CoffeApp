import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Coffe-Model.dart';
class OrderService {
  Future<List<CoffeeModel>> fetchDeliveredOrders() async {
    final response = await http.get(Uri.parse('http://localhost:9000/order/delivered-orders'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => CoffeeModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load delivered orders');
    }
  }
}
