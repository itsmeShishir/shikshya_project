import 'package:flutter/material.dart';

class SettingScren extends StatefulWidget {
  const SettingScren({super.key});

  @override
  State<SettingScren> createState() => _SettingScrenState();
}

class _SettingScrenState extends State<SettingScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Setting Page"),
      ),
    );
  }
}