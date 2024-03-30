

import 'package:hamroshop/api/reviewAPI.dart';
import 'package:hamroshop/response/reviewResponse.dart';

class ReviewRepository {
  Future<bool> addReview(String id, int rating, String comment) async {
    return await ReviewApi().addReview(id, rating, comment);
  }
  Future<ReviewResponse?> getReviews(String? id) async{
    return await ReviewApi().getReviews(id);
  }
}
