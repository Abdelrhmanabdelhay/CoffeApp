import 'package:flutter/material.dart';
import '../Services/Order-Services.dart';
import '../models/Coffe-Model.dart';

class NotficationPage extends StatefulWidget {
  const NotficationPage({super.key});

  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
  late Future<List<CoffeeModel>> _deliveredOrdersFuture;

  @override
  void initState() {
    super.initState();
    _deliveredOrdersFuture = OrderService().fetchDeliveredOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            "Notifications",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FutureBuilder<List<CoffeeModel>>(
              future: _deliveredOrdersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No delivered orders yet.'));
                }

                final orders = snapshot.data!;

                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];

                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Icon(Icons.local_cafe, color: Colors.brown),
                          ),
                          title: Text(order.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order.category),
                              Text("\$${order.price}"),
                              if (order.message != null && order.message!.isNotEmpty)
                                Text(order.message!, style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
