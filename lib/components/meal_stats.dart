import 'package:flutter/material.dart';
import 'package:cukbuk/utils/constants.dart';

class MealInfoBuilder extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  MealInfoBuilder({@required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (var i in items) buildRow(text: i['text'], icon: i['icon']),
        ],
      ),
    );
  }

  Row buildRow({text, icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: kHappyOrange,
          size: 25,
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
