import 'package:flutter_test/flutter_test.dart';
import 'package:tech_challenge/controller/blood_glucose_controller.dart';
import 'package:tech_challenge/model/blood_glucose_sample.dart';

void main() {
  test('Given blood glucose samples calculates min', () async {
    // ARRANGE
    List<BloodGlucoseSample> bloodGlucoseSamples = <BloodGlucoseSample>[];
    bloodGlucoseSamples.add(BloodGlucoseSample(4, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(6, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(42, DateTime.now(), "unit"));
    BloodGlucoseController controller =
        BloodGlucoseController(bloodGlucoseSamples);

    // ACT
    double min = controller.getMin();

    // ASSERT
    expect(4.0, min);
  });

  test('Given blood glucose samples calculates max', () async {
    // ARRANGE
    List<BloodGlucoseSample> bloodGlucoseSamples = <BloodGlucoseSample>[];
    bloodGlucoseSamples.add(BloodGlucoseSample(4, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(56, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(114, DateTime.now(), "unit"));
    BloodGlucoseController controller =
        BloodGlucoseController(bloodGlucoseSamples);

    // ACT
    double max = controller.getMax();

    // ASSERT
    expect(114.0, max);
  });

  test('Given blood glucose samples calculates average', () async {
    // ARRANGE
    List<BloodGlucoseSample> bloodGlucoseSamples = <BloodGlucoseSample>[];
    bloodGlucoseSamples.add(BloodGlucoseSample(10, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(30, DateTime.now(), "unit"));
    BloodGlucoseController controller =
        BloodGlucoseController(bloodGlucoseSamples);

    // ACT
    double max = controller.getAverage();

    // ASSERT
    expect(20.0, max);
  });

  test('Given blood glucose samples calculates median', () async {
    // ARRANGE
    List<BloodGlucoseSample> bloodGlucoseSamples = <BloodGlucoseSample>[];
    bloodGlucoseSamples.add(BloodGlucoseSample(3, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(23, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(42, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(47, DateTime.now(), "unit"));
    bloodGlucoseSamples.add(BloodGlucoseSample(123, DateTime.now(), "unit"));
    BloodGlucoseController controller =
        BloodGlucoseController(bloodGlucoseSamples);

    // ACT
    double max = controller.getMedian();

    // ASSERT
    expect(42.0, max);
  });
}
