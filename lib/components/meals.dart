import 'package:cukbuk/components/name_formatter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cukbuk/utils/constants.dart';

class Meals extends StatefulWidget {
  final meal;
  Meals({this.meal});

  int getMealId() => meal['id'];

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: kMealContainerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 180,
            width: 180,
            decoration: buildMealBoxDecoration(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          MealNameFormatter(name: widget.meal['title'],size: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          buildMealFooter()
        ],
      ),
    );
  }

  BoxDecoration buildMealBoxDecoration() {
    return BoxDecoration(
        image: DecorationImage(
            image:
                NetworkImage('$kSpoonBaseUrl/${widget.meal['id']}-636x393.jpg'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey,
              spreadRadius: -3,
              blurRadius: 10)
        ],
        color: Colors.yellowAccent);
  }

  Row buildMealFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildMetaData(FontAwesomeIcons.clock, 'readyInMinutes'),
        buildMetaData(FontAwesomeIcons.users, 'servings'),
      ],
    );
  }

  Container buildMetaData(IconData icon, String key) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: kHappyOrange,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${widget.meal[key]}',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

