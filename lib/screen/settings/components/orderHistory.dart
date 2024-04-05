import 'package:flutter/material.dart';
import 'package:hamroshop/models/order.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Order> _orders = []; 

  @override
  void initState() {
    super.initState();
    _loadOrderHistory(); 
  }

  Future<void> _loadOrderHistory() async {
    List<Order> orders = await fetchOrderHistory(); 
    setState(() {
      _orders = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: _orders.isEmpty
          ? Center(
              child: Text('No order history available.'),
            )
          : ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                return ListTile(
                  title: Text('Order ID: ${order.id}'),
                  subtitle: Text('Total Price: \$${order.totalPrice}'),
                  
                );
              },
            ),
    );
  }
}

Future<List<Order>> fetchOrderHistory() async {
  await Future.delayed(Duration(seconds: 1));
  
  List<Order> orders = [
    Order(id: '1', totalPrice: 50),
    Order(id: '2', totalPrice: 75),
    Order(id: '3', totalPrice: 100),
  ];
  
  return orders;
}
