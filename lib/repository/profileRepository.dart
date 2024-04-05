
import 'package:hamroshop/api/profileAPI.dart';
import 'package:hamroshop/response/profileResponse.dart';

class ProfileRepository {
  Future<ProfileResponse?> getprofile() async {
    return ProfileAPI().getprofile();
  }
}

