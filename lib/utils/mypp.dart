import 'package:flutter/material.dart';
import 'package:hamroshop/screen/Dashboard/dashboard.dart';
import 'package:hamroshop/screen/homeScreen/homeScree.dart';
import 'package:hamroshop/screen/login/login.dart';
import 'package:hamroshop/screen/onboarding/onboarding_screen.dart';
import 'package:hamroshop/screen/payment/order_confirm.dart';
import 'package:hamroshop/screen/register/register.dart';
import 'package:hamroshop/screen/settings/components/change_password.dart';
import 'package:hamroshop/screen/settings/components/change_profile.dart';
import 'package:hamroshop/screen/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hamro Shop",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/onboarding":(context) => OnboardingScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/home": (context) => HomeScreen(),
        "/dash": (context) => Dashboard(),
        "/changepassword":(context) => ChangePassword(),
        "/editprofile" :(context) => EditProfile(),
        '/confirm_order': (context) => const ConfirmOrderScreen(),
      },
    );
  }
}