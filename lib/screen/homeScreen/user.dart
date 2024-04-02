import 'package:flutter/material.dart';
import 'package:hamroshop/models/profiles.dart';
import 'package:hamroshop/repository/profileRepository.dart';
import 'package:hamroshop/response/profileResponse.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<ProfileResponse?>(
        future: ProfileRepository().getprofile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Profile? profileResponse = snapshot.data!.user;
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Hi There,",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    profileResponse!.email!.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              );
            }
            {
              return const Center(
                child: Text("No data Found Please login"),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Waiting"),
            );
          }else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
