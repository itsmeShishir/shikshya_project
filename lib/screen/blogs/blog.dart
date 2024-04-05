import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hamroshop/screen/cart/cart_provider.dart';
import 'package:hamroshop/screen/cart/screen.dart';
import 'package:hamroshop/screen/product_details/item_details_page.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductCatalog extends StatefulWidget {
  @override
  _ProductCatalogState createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://192.168.1.13:2000/api/v2/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        products = data['products'];
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchProducts,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(8.0),
                elevation: 4.0,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 4,
                          child: product['images'].isEmpty
                              ? Image.asset(
                                  'assets/placeholder_image.png',
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 150,
                                )
                              : Image.network(
                                  product['images'][0]['url'],
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 350,
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('\$${product['offerPrice']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                        onPressed: () {
                          final cartProvider = Provider.of<CartProvider>(context, listen: false);
                          cartProvider.addCounter(); 
                          cartProvider.addTotalPrice(product['offerPrice']); 
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
