import 'package:flutter/material.dart';
import 'package:hamroshop/screen/cart/cart_provider.dart';
import 'package:hamroshop/utils/mypp.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child:  MyApp(),
    ),
  );
}

