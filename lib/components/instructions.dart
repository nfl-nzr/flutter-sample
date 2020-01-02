import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  final List steps;

  Instructions({@required this.steps});

  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  List<String> instructions = [];

  parseInstructions() {
    final steps = widget.steps;
    steps.forEach((step) {
      if (step['steps'].length > 0) {
        step['steps'].forEach((stepItem) {
          instructions.add(stepItem['step']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    parseInstructions();
    List<Widget> getList() {
      final list = instructions.map((item) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 8,
                width: 8,
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    item,
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        );
      }).toList();
      return list;
    }

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 5,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.grey),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              'Instructions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100.0,
              child: ListView(
                children: <Widget>[...getList()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
