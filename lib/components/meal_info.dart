import 'package:cukbuk/components/instructions.dart';
import 'package:cukbuk/components/meal_image.dart';
import 'package:cukbuk/components/meal_stats.dart';
import 'package:cukbuk/components/name_formatter.dart';
import 'package:cukbuk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MealHeader extends StatefulWidget {
  final meal;

  MealHeader({this.meal});

  @override
  _MealHeaderState createState() => _MealHeaderState();
}

class _MealHeaderState extends State<MealHeader> {
  @override
  Widget build(BuildContext context) {
    var items = [
      {
        'text': '${widget.meal['healthScore'].round()} points',
        'icon': FontAwesomeIcons.star
      },
      {
        'text': '${widget.meal['readyInMinutes']} MINS',
        'icon': FontAwesomeIcons.clock
      },
      {
        'text': '${widget.meal['servings']} PEOPLE',
        'icon': FontAwesomeIcons.users
      }
    ];
    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        parallaxEnabled: true,
        minHeight: MediaQuery.of(context).size.height / 10.5,
        padding: EdgeInsets.only(top: 5, left: 20, right: 20),
        panel: Container(
            margin: EdgeInsets.only(top: 15),
            child: Instructions(
              steps: widget.meal['analyzedInstructions'],
            )),
        body: Container(
          color: kSadBlue,
          child: Column(
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: kSadBlue,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: 40,
                          top: MediaQuery.of(context).size.height / 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                              width:
                                  MediaQuery.of(context).size.width / 2 + 150,
                              child: MealNameFormatter(
                                name: widget.meal['title'],
                                size: 28,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: 40,
                          top: MediaQuery.of(context).size.height / 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: IntrinsicWidth(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    MealInfoBuilder(
                                      items: items,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: MealImageBuilder(
                              imageId: widget.meal['id'],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
