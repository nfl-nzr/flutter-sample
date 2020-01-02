import 'package:cukbuk/components/meals.dart';
import 'package:cukbuk/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DishSlider extends StatelessWidget {
  final items;

  DishSlider({this.items});

  @override
  Widget build(BuildContext context) {
    if (items != null) {
      return CarouselSlider(
        height: MediaQuery.of(context).size.height/2,
        enableInfiniteScroll: false,
        initialPage: 1,
        items: items['meals'].map<Widget>((i) {
          Meals meal = Meals(meal: i);
          return Builder(
            builder: (BuildContext context) {
              return buildHero(meal, context);
            },
          );
        }).toList(),
      );
    } else {
      return Container(
        child: Center(
          child: Text('Loading'),
        ),
      );
    }
  }

  Hero buildHero(Meals meal, BuildContext context) {
    return Hero(
      tag: meal.getMealId(),
      flightShuttleBuilder: (BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext) =>
          Material(child: toHeroContext.widget),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    tag: meal.getMealId(),
                  ),
                ),
              );
            },
            child: meal,
          ),
        ],
      ),
    );
  }
}
