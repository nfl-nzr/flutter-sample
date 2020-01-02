import 'package:flutter/material.dart';

const loadingScreenRoute = '/loading';
const homeScreenRoute = '/home-screen';
const errorScreenRoute = '/error';

const kSpoonKey = 'b9ad0f5f70a2490fbfa6630e543bb735';
const kSpoonApiBaseUrl = 'https://api.spoonacular.com';
const kSpoonBaseUrl = 'https://spoonacular.com/recipeImages/';

//Styles
const kSadBlue = Color(0xFFDEE8FF);
const kHappyOrange = Color(0xFFFF795B);


const kMealsHeaderStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 50.0);

//Blue color decoration for containers in homepage
const kMealContainerDecoration = BoxDecoration(
    color: kSadBlue,
    borderRadius: BorderRadius.all(Radius.circular(30)),
    boxShadow: [
      BoxShadow(
          offset: Offset(0, 40),
          color: Colors.grey,
          spreadRadius: -10,
          blurRadius: 50)
    ]);

const kMealNameStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
