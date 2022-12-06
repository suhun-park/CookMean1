import 'package:cookmean/model/calenderModel.dart';
import 'package:cookmean/schedule/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../schedule/bottomsheet.dart';
import '../schedule/calendar.dart';

class Day extends StatefulWidget {
  const Day({Key? key}) : super(key: key);

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
         calendar(),
          custom_text_field(),
          BottomUserSheet(),
        ],
    );
  }
}



