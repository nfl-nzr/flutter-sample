import 'package:flutter/material.dart';
import 'package:cukbuk/components/slider.dart';

class Home extends StatefulWidget {
  final meals;
  Home({this.meals});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: DishSlider(
                  items: widget.meals,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
