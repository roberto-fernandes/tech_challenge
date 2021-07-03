class BloodGlucoseSample {
  double? value;
  DateTime? timestamp;
  String? unit;

  BloodGlucoseSample(this.value, this.timestamp, this.unit);

  BloodGlucoseSample.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value']);
    timestamp = DateTime.parse(json['timestamp']);
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value.toString();
    data['timestamp'] = this.timestamp.toString();
    data['unit'] = this.unit;
    return data;
  }
}
