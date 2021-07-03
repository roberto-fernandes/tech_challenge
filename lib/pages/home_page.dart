import 'package:flutter/material.dart';
import 'package:tech_challenge/controller/blood_glucose_controller.dart';
import 'package:tech_challenge/model/blood_glucose_response.dart';
import 'package:tech_challenge/model/blood_glucose_sample.dart';
import 'package:tech_challenge/network/network_calls.dart';
import 'package:tech_challenge/widgets/blood_glucose_chart.dart';
import 'package:tech_challenge/widgets/date_picker.dart';
import 'package:tech_challenge/widgets/statistical_elements.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTimeRange? dateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<BloodGlucoseResponse>(
      future: fetchBloodGlucose(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BloodGlucoseSample>? bloodGlucoseSamples =
              snapshot.data?.bloodGlucoseSamples;
          BloodGlucoseController controller =
              BloodGlucoseController(bloodGlucoseSamples);

          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(dateRange, onRangeChange),
                  if (bloodGlucoseSamples != null)
                    BloodGlucoseChart(controller),
                  StatisticalElements(controller)
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    ));
  }

  void onRangeChange(DateTimeRange? newDateRange) {
    setState(() => dateRange = newDateRange);
  }
}
