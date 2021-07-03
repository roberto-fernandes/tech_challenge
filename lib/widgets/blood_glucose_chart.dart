import 'package:flutter/material.dart';
import 'package:tech_challenge/controller/blood_glucose_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tech_challenge/model/blood_glucose_sample.dart';

class BloodGlucoseChart extends StatelessWidget {
  final BloodGlucoseController bloodGlucoseController;
  BloodGlucoseChart(this.bloodGlucoseController);
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return bloodGlucoseController.bloodGlucoseSamples != null
        ? SfCartesianChart(
            title: ChartTitle(text: 'Blood Glucose'),
            legend: Legend(isVisible: true),
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries<BloodGlucoseSample, DateTime>>[
              LineSeries<BloodGlucoseSample, DateTime>(
                  name: 'Blood Glucose',
                  dataSource: bloodGlucoseController.bloodGlucoseSamples!,
                  xValueMapper: (BloodGlucoseSample bloodGlucoseSample, _) =>
                      bloodGlucoseSample.timestamp,
                  yValueMapper: (BloodGlucoseSample bloodGlucoseSample, _) =>
                      bloodGlucoseSample.value,
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                  enableTooltip: true)
            ],
            primaryXAxis: DateTimeAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            ),
          )
        : SizedBox();
  }
}
