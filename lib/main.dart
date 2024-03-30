import 'package:flutter/material.dart';
import 'package:hamroshop/utils/myapp.dart';
import 'objectbox/objectbox.dart';

late ObjectBox objectBox;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  runApp(const MyApp());
}

