
import 'package:flutter/material.dart';

class MealNameFormatter extends StatelessWidget {
  const MealNameFormatter({
    Key key,
    @required this.name,
    @required this.size
  }) : super(key: key);

  final String name;
  final double size;

  formatString() {
    List<String> splitedString = this.name.split(' ');
    String firstName = '';
    splitedString.asMap().forEach((i, n) {
      if (i != splitedString.length - 1) {
        firstName = '$firstName$n ';
      }
    });
    if (splitedString.length > 0) {
      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: this.size,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: firstName),
            TextSpan(
                text: splitedString[splitedString.length - 1],
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
    } else
      return Text(
        this.name,
        style: TextStyle(fontSize: this.size, fontWeight: FontWeight.w300),
      );
  }

  @override
  Widget build(BuildContext context) {
    return formatString();
  }
}
