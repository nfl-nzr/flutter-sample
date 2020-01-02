import 'package:cukbuk/utils/constants.dart';
import 'package:cukbuk/screens/loading.dart';
import 'package:cukbuk/screens/home.dart';
import 'package:cukbuk/screens/error.dart';
import 'package:flutter/cupertino.dart';

class Router {
  BuildContext context;
  Router({this.context});

  Map getRoutes() {
    Map<String, WidgetBuilder> router = {
      loadingScreenRoute: (context) => LoadingScreen(),
      homeScreenRoute: (context) => Home(),
      errorScreenRoute: (context) => ErrorPage()
    };

    return router;
  }
}
