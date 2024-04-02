import 'package:flutter/material.dart';
import 'package:hamroshop/screen/settings/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScren extends StatefulWidget {
  const SettingScren({super.key});

  @override
  State<SettingScren> createState() => _SettingScrenState();
}

class _SettingScrenState extends State<SettingScren> {
  @override
  void logout() async {
    SharedPreferences arun = await SharedPreferences.getInstance();
    arun.remove("token");
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: Text("Change Password"),
            ),
          ],
        ),
      ),
    );
  }
}
