import 'package:flutter/material.dart';
import 'package:hamroshop/models/userModel.dart';
import 'package:hamroshop/repository/userRepository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? username;
  String? email;
  String? password;
  String? confirmPassword;

  _registerUser(User user) async {
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      Navigator.popAndPushNamed(context, '/signin');
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(msg) {
    if (msg) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Success Register'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Register'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  "https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHx8MA%3D%3D",
                  height: 150,
                  width: 150,
                ),
                const Text(
                  "Welcome to HamroBlog",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                Container(
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          key: const ValueKey("txtName"),
                          controller: nameController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Your name";
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              username = value;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.people),
                              labelText: 'Enter your User Name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          key: const ValueKey('txtEmail'),
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
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
                          key: const ValueKey('txtPassword'),
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
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
                        TextFormField(
                          key: const ValueKey('txtConfirmPassword'),
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your confirm password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            if (value != password) {
                              return 'Password not match';
                            }
                            return null;
                          },
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              confirmPassword = value;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Enter Conform Password'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                fixedSize: const Size(200, 75)),
                            onPressed: () {
                              User user = User(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              _registerUser(user);
                            },
                            key: const ValueKey('btnRegister'),
                            child: const Text(
                              "Register",
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
                              "Allready have an Account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 10, 10),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
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
