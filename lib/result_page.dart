import 'package:bmi_calculator/actual_result.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  const ResultPage({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("YOUR RESULT")),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ActualResult(height, weight),
    );
  }
}
