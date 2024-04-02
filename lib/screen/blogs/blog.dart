import 'package:flutter/material.dart';
import 'package:hamroshop/models/products.dart';
import 'package:hamroshop/repository/productRepository.dart';
import 'package:hamroshop/response/productResponse.dart';
import 'package:hamroshop/utils/productCart.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  
  
  String? search;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder<ProductResponse?>(
              future: ProductRepository().getproducts(search),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ProductResponse productResponse = snapshot.data!;
                    List<Product> lstproducts = snapshot.data!.products!;
                    print(snapshot.data!.products!);
                    return GridView.builder(
                        shrinkWrap: true,
                        primary: true,
                        itemCount: lstproducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCards(
                            productName: lstproducts[index].name.toString(),
                            productPrice: lstproducts[index].price.toString(),
                            productImagePath: lstproducts[index]
                                    .images![0]
                                    .url ??
                                "https://res.cloudinary.com/kingsly/image/upload/v1676963431/lk_fx0mbs.png",
                            onPressed: () {
                              print('cccc ${lstproducts[index].reviews}');
                              Navigator.pushNamed(context, '/new', arguments: {
                                "images": lstproducts[index].images![0].url,
                                "name": lstproducts[index].name,
                                "price": lstproducts[index].price,
                                "description": lstproducts[index].description,
                                "id": lstproducts[index].id,
                                "rating": lstproducts[index].ratings,
                                "stock": lstproducts[index].stock,
                                "reviews": lstproducts[index].reviews,
                                "time": lstproducts[index].time,
                              });
                            },
                          );
                        });
                  } else {
                    return const Center(
                      child: Text("No data"),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  );
                }
              },
            ),
            
          ),
        ],
      ),
    );
  }
}
