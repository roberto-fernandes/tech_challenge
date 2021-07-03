import 'package:flutter/material.dart';
import 'package:tech_challenge/controller/blood_glucose_controller.dart';

class StatisticalElements extends StatelessWidget {
  final BloodGlucoseController controller;
  StatisticalElements(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataWidget('MIN', controller.getMin().toStringAsPrecision(2)),
            SizedBox(
              width: 50,
            ),
            DataWidget('MAX', controller.getMax().toStringAsPrecision(2)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataWidget('Median', controller.getMedian().toStringAsPrecision(2)),
            SizedBox(
              width: 50,
            ),
            DataWidget(
                'Average', controller.getAverage().toStringAsPrecision(2)),
          ],
        ),
      ],
    );
  }
}

class DataWidget extends StatelessWidget {
  final String label;
  final String value;

  const DataWidget(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Text(
          value,
          style: TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}
