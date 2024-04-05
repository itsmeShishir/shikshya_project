import 'package:flutter/material.dart';
import 'package:hamroshop/screen/cart/cart_provider.dart';
import 'package:hamroshop/screen/payment/payment.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          final List<dynamic> cartItems = cartProvider.cartItems;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final dynamic cartItem = cartItems[index];
                    return ListTile(
                      title: Text(cartItem['name']),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('\$${cartItem['offerPrice']}'),
                      ],),
                      leading: cartItem['images'] != null
                          ? Image.network(
                              cartItem['images'][0]['url'],
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(
                              width: 50,
                              height: 50,
                              child: Placeholder(),
                            ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cartProvider.removeCartItem(cartItem);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ShippngScreen()));
                      },
                      child: Text('Proceed to Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
