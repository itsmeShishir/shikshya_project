import 'package:hamroshop/api/profileApi.dart';
import 'package:hamroshop/response/profileResponse.dart';

class ProfileRepository {
  Future<ProfileResponse?> getprofile() async {
    return await ProfileAPI().getprofile();
  }
}
