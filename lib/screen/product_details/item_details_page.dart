import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hamroshop/screen/cart/cart_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product['name']}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['images'][0]['url']),
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${product['description']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${product['offerPrice']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final cartProvider = Provider.of<CartProvider>(context, listen: false);
                cartProvider.addCartItem(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Product added to cart'),
                  duration: Duration(seconds: 2),
                ));
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
