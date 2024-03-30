import 'package:flutter/material.dart';
import 'package:hamroshop/models/userModel.dart';
import 'package:hamroshop/repository/userRepository.dart';
import 'package:hamroshop/screen/Dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Dashboard();
      }));
    } else {
      print("Error");
    }
  }

  _loginUser(User user) async {
    try {
      UserRepository userRepository = UserRepository();

      bool isLogin = await userRepository.loginUser(user);

      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();

    autoLogin();
  }

  void autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    print(token);

    if (token != null && token.isNotEmpty) {
      _navigateToScreen(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktopOrIpad = MediaQuery.of(context).size.width > 768.0;
    double buttonWidth = isDesktopOrIpad ? 500.0 : double.infinity;
    double buttonHeight = isDesktopOrIpad ? 60.0 : double.infinity;

    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/image/logo-no-background.png",
                  width: isDesktopOrIpad ? 150 : 120,
                  height: isDesktopOrIpad ? 150 : 120,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: isDesktopOrIpad ? 500 : double.infinity,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          key: ValueKey('txtEmail'),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.mail),
                              labelText: 'Enter your Email Address'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          key: ValueKey('txtPassword'),
                          controller: passwordController,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Enter your Password'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              fixedSize: Size(buttonWidth, buttonHeight),
                            ),
                            key: ValueKey('btnLogin'),
                            onPressed: () {
                              User user = User(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              _loginUser(user);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "OR",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Does not have an Account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/register");
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 10, 10),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
