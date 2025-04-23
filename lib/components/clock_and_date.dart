import 'package:caliana_clone/utility/divider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

class DateAndClock extends StatefulWidget {
  @override
  _DateAndClockState createState() => _DateAndClockState();
}

class _DateAndClockState extends State<DateAndClock> {
  late String formattedDay;
  late String formattedDate;
  late String formattedTime;
  late Timer _timer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null).then((_) {
      setState(() {
        _isInitialized = true;
        _updateTime();
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          _updateTime();
        });
      });
    });
  }

  void _updateTime() {
    if (!_isInitialized) return;

    DateTime now = DateTime.now();
    setState(() {
      formattedDay = DateFormat('EEEE', 'id_ID').format(now);
      formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(now);
      formattedTime = DateFormat('hh:mm:ss a', 'id_ID').format(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$formattedDay, $formattedDate',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        gapHeight(8),
        // Text(
        //   formattedDate,
        //   style: TextStyle(
        //     fontSize: 14,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        // gapHeight(8),
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
