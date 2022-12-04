import 'package:flutter/material.dart';

class ActualResult extends StatefulWidget {
  final int height;
  final int weight;

  const ActualResult(this.height, this.weight, {super.key});

  @override
  State<ActualResult> createState() => _ActualResultState();
}

class _ActualResultState extends State<ActualResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  headline,
                ),
                Text(
                  '${bmiResult(widget.height, widget.weight)}',
                ),
                Column(
                  children: const [
                    Text('Normal BMI range:'),
                    Text(
                      "18.5 - 25 kg/m²",
                    ),
                  ],
                ),
                Text(
                  comment,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.1,
            child: const Center(
              child: Text(
                'RE-CALCULATE',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

var comment = '';
var headline = '';
bmiResult(h, w) {
  double bmi = (w / (h * h)) * 10000;

  if (bmi < 18.5) {
    comment = "You are under Weight";
    headline = "UNDERWEIGHT";
  } else if (bmi >= 18.5 && bmi < 25) {
    comment = "You are at a healthy weight.";
    headline = "NORMAL";
  } else if (bmi > 25 && bmi <= 29.99) {
    comment = "You are at overweight.";
    headline = "OVERWEIGHT";
  } else {
    comment = "You are obese.";
    headline = "OBESE";
  }

  return bmi.round();
}
