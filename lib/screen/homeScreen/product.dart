import 'package:flutter/material.dart';
import 'package:hamroshop/dummydata/productdata.dart';
import 'package:hamroshop/widget/cardswidget.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        for (var product in dummyProducts)
          ProductCard(
            product: product,
          ),
      ],
    );
  }
}
