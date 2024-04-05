import 'package:flutter/material.dart';
import 'package:hamroshop/screen/cart/cart_provider.dart';
import 'package:hamroshop/utils/mypp.dart';
import 'package:provider/provider.dart';

void main() async{
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child:  MyApp(),
    ),
  );
}

