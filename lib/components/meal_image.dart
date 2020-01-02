import 'package:flutter/material.dart';
import 'package:cukbuk/utils/constants.dart';

class MealImageBuilder extends StatelessWidget {
  final int imageId;

  const MealImageBuilder({Key key, @required this.imageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 250,
        height: 250,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10), color: Colors.grey, blurRadius: 20),
          ],
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('$kSpoonBaseUrl/$imageId-636x393.jpg'),
          ),
        ),
      ),
    );
  }
}
