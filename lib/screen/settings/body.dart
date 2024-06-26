import 'package:flutter/material.dart';
import 'package:hamroshop/models/profiles.dart';
import 'package:hamroshop/repository/profileRepository.dart';
import 'package:hamroshop/response/profileResponse.dart';
import 'package:hamroshop/screen/settings/profile_menu.dart';
import 'package:hamroshop/screen/settings/profile_pic.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String User = "${Icon(Icons.verified_user)}";
  final String Setting = "${Icon(Icons.settings)}";
  final String Question = "${Icon(Icons.question_mark)}";
  final String Exit = "${Icon(Icons.exit_to_app)}";

  @override
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    Navigator.pushNamed(context, '/login');
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder<ProfileResponse?>(
        future: ProfileRepository().getprofile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Profile? profileResponse = snapshot.data!.user;
              return Column(
                children: [
                  ProfilePic(image: profileResponse!.avatar!.url),
                  const SizedBox(height: 10),
                  Text(profileResponse.name.toString(),
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 116, 116, 116))),
                  Text(profileResponse.email.toString(),
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 116, 116, 116))),
                  const SizedBox(height: 20),
                  ProfileMenu(
                    text: "Edit Profile",
                    icon: User,
                    press: () => {
                      Navigator.pushNamed(context, "/editprofile", arguments: {
                        "name": profileResponse.name.toString(),
                        "email": profileResponse.email.toString()
                      })
                    },
                  ),
                  ProfileMenu(
                    text: "Change Password",
                    icon: Setting,
                    press: () {
                      Navigator.pushNamed(context, "/changepassword");
                    },
                  ),
                  ProfileMenu(
                    text: "My Order",
                    icon: Question,
                    press: () {
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: Exit,
                    press: () {
                      logout();
                    },
                  ),
                ],
              );
            }
            {
              return const Center(
                child: Text("No data"),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
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
    );
  }
}
