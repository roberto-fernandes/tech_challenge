import 'package:tech_challenge/model/blood_glucose_sample.dart';

class BloodGlucoseResponse {
  List<BloodGlucoseSample>? bloodGlucoseSamples;

  BloodGlucoseResponse(this.bloodGlucoseSamples);

  BloodGlucoseResponse.fromJson(Map<String, dynamic> json) {
    if (json['bloodGlucoseSamples'] != null) {
      bloodGlucoseSamples = <BloodGlucoseSample>[];
      json['bloodGlucoseSamples'].forEach((v) {
        bloodGlucoseSamples?.add(new BloodGlucoseSample.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bloodGlucoseSamples'] =
        this.bloodGlucoseSamples?.map((v) => v.toJson()).toList();
    return data;
  }
}
