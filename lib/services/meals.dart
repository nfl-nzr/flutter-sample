import 'dart:convert';
import 'package:cukbuk/utils/constants.dart';
import 'package:http/http.dart';

//TODO: Split the networking services.

//Service to get the recipies for three meals.
class MealsService {
  int mealId;
  MealsService({this.mealId});

  Future getDetails() async {
    var data;
    final basicInfo =
        '$kSpoonApiBaseUrl/recipes/${this.mealId}/information?apiKey=$kSpoonKey';
    final Response response = await get(basicInfo);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    }
    return data;
  }
}
