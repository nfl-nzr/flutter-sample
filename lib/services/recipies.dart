import 'dart:convert';
import 'package:cukbuk/utils/constants.dart';
import 'package:http/http.dart';

/*Service to get the detailed information and
 cooking instructions for individual recipies*/ 
 
class Recipie {
  Future<Map<String, dynamic>> getRecipiesForTheDay() async {
    var data;
    final url =
        '$kSpoonApiBaseUrl/recipes/mealplans/generate?timeFrame=day&apiKey=$kSpoonKey';
    final Response response = await get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return data;
  }
}
