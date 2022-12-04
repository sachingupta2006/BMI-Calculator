import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 18;
  int weight = 65;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

  ageIncrement() {
    setState(() {
      age++;
    });
  }

  ageDecrement() {
    setState(() {
      age--;
    });
  }

  weightIncrement() {
    setState(() {
      weight++;
    });
  }

  weightDecrement() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text("BMI")),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/male.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("MALE"),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/female.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("FEMALE"),
                  ],
                ),
              ))
            ],
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HEIGHT in CM"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$height"),
                ),
                Slider(
                  value: height.toDouble(),
                  min: minHeight,
                  max: maxHeight,
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.black,
                  onChanged: (nvalue) {
                    setState(() {
                      height = nvalue.round();
                    });
                  },
                  semanticFormatterCallback: (nvalue) {
                    return "$nvalue.round()";
                  },
                )
              ],
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("WEIGHT"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$weight",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: weightDecrement,
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.all(10),
                            child: const Center(
                              child: Text("-"),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: weightIncrement,
                            child: const Center(
                              child: Text("+"),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("AGE"),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text("$age"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: ageDecrement,
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.all(10),
                              child: const Center(
                                child: Text("-"),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: ageIncrement,
                              child: const Center(
                                child: Text("+"),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    height: height,
                    weight: weight,
                  ),
                ))),
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Center(
                child: Text("CALCULATE BMI"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
