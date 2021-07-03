import 'package:tech_challenge/model/blood_glucose_sample.dart';

class BloodGlucoseController {
  List<BloodGlucoseSample>? bloodGlucoseSamples;

  //TODO implement logic to change data when selecting a new range

  BloodGlucoseController(this.bloodGlucoseSamples);

  /// Calculate median
  double getMedian() {
    double median = 0;
    Iterable<double>? values =
        bloodGlucoseSamples?.map((element) => element.value ?? 0);

    //clone list
    List<double> clonedList = [];
    if (values != null) {
      clonedList.addAll(values);

      //sort list
      clonedList.sort((a, b) => a.compareTo(b));

      int middle = clonedList.length ~/ 2;
      if (clonedList.length % 2 == 1) {
        median = clonedList[middle];
      } else {
        median = (clonedList[middle - 1] + clonedList[middle]) / 2.0;
      }
    }
    return median;
  }

  /// Calculate Min
  double getMin() {
    return bloodGlucoseSamples
            ?.reduce((curr, next) =>
                (curr.value ?? 0) < (next.value ?? 0) ? curr : next)
            .value ??
        0;
  }

  /// Calculate Max
  double getMax() {
    return bloodGlucoseSamples
            ?.reduce((curr, next) =>
                (curr.value ?? 0) > (next.value ?? 0) ? curr : next)
            .value ??
        0;
  }

  /// Calculate Average
  double getAverage() {
    List<double>? values =
        bloodGlucoseSamples?.map((element) => element.value ?? 0).toList();
    double sum = 0;
    values?.forEach((element) => sum += element);
    double result = 0;
    if (sum > 0) {
      result = sum / (values?.length ?? 0);
    }

    return result;
  }
}
