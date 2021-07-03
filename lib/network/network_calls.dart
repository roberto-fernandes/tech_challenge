import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tech_challenge/model/blood_glucose_response.dart';
import 'package:tech_challenge/utils/Constants.dart';

Future<BloodGlucoseResponse> fetchBloodGlucose() async {
  Uri url = Uri.parse(Constants.BASE_URL);
  final response = await http.get(url);

  //statusCode 200 means OK response.
  if (response.statusCode == 200) {
    return BloodGlucoseResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Blood Glucose');
  }
}
