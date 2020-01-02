import 'package:cukbuk/screens/home.dart';
import 'package:cukbuk/services/recipies.dart';
import 'package:cukbuk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MealsData {
  final meals;
  MealsData({this.meals});
  getMeals() => this.meals;
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Recipie recipieService = Recipie();

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  void _fetchMeals() async {
    final data = await recipieService.getRecipiesForTheDay();

    if (data == null) {
      Navigator.pushNamed(context, errorScreenRoute);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            meals: data,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Daily',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 40),
                      ),
                      Text(
                        'Meal',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 40),
                      )
                    ],
                  ),
                ),
                SpinKitThreeBounce(
                  color: Colors.black,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
