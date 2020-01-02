import 'package:cukbuk/components/meal_info.dart';
import 'package:flutter/material.dart';
import 'package:cukbuk/services/meals.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailsPage extends StatefulWidget {
  final tag;
  DetailsPage({this.tag});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  Future fetchInstructions() async {
    MealsService mealsService = MealsService(mealId: widget.tag);
    final data = await mealsService.getDetails();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await fetchInstructions(),
      renderLoad: () => SpinKitThreeBounce(
        color: Colors.black,
        size: 20,
      ),
      renderError: ([error]) => new Text('Recipie could not be loaded!'),
      renderSuccess: ({data}) {
        return Container(
          child: MealHeader(meal: data),
        );
      },
    );

    return Scaffold(
      body: Hero(
        tag: widget.tag,
        child: SafeArea(
          child: Container(
            color: Color(0xFFDEE8FF),
            child: Center(child: _asyncLoader),
          ),
        ),
      ),
    );
  }
}
