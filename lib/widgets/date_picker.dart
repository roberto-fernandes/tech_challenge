import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(this.dateRange, this.onRangeChange);

  final DateTimeRange? dateRange;
  final Function onRangeChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => pickDateRange(context), child: Text(getStart())),
        Icon(Icons.arrow_forward, color: Colors.black),
        ElevatedButton(
            onPressed: () => pickDateRange(context), child: Text(getEnd())),
      ],
    );
  }

  String getStart() {
    if (dateRange == null) {
      return 'Start';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateRange!.start);
    }
  }

  String getEnd() {
    if (dateRange == null) {
      return 'End';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateRange!.end);
    }
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 10)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    this.onRangeChange(newDateRange);
  }
}
