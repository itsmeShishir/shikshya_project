import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
  List<String> images = [
    "https://plus.unsplash.com/premium_photo-1661964291917-b20c2648fac6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2FyJTIwcGFydHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    "https://plus.unsplash.com/premium_photo-1664299397754-9e433381039d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNhciUyMHBhcnRzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1537462715879-360eeb61a0ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FyJTIwcGFydHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1556448851-9359658faa54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNhciUyMHBhcnRzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"
  ];
  final List productType = [
    [
      "sports clothing",
    ],
    [
      "sports footwear",
    ],
    [
      "sports accessories",
    ],
    [
      "sports equipment",
    ],
    [
      "sports nutrition",
    ],
    [
      "sports gadgets",
    ],
    [
      "sports bags",
    ],
    [
      "sports watches",
    ],
    [
      "sports sunglasses",
    ],
    [
      "sports caps",
    ],
    [
      "sports gloves",
    ],
    [
      "sports belts",
    ],
  ];
  // make String dynamci list of product type

  String? search;

  void CategorySelected(int index) {
    setState(() {
      for (int i = 0; i < productType.length; i++) {
        productType[i][1] = false;
      }
      productType[index][1] = true;
    });
  }

  int activeimage = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),

          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              viewportFraction: 0.98,
              // autoPlay: true,
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: CachedNetworkImage(
                      imageUrl: i,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          // category section

          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text("Hamro Car Parts Cateories",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 183, 20, 77))),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text("Spare Parts Products List",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 8, 83))),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: FutureBuilder<ProductResponse?>(
              future: ProductRepository().getproducts(search),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ProductResponse productResponse = snapshot.data!;
                    debugPrint("$productResponse");
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
                          return ProductCard(
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
