import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget {
  const calendar({Key? key}) : super(key: key);

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
      margin: EdgeInsets.fromLTRB(10, 0,0 , 0),
      child: TableCalendar(
        firstDay:DateTime.utc(2000,01,01),
        lastDay:DateTime.utc(2099,01,01),
        focusedDay:focusedDay,
        locale: 'ko-kr',
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),

        onDaySelected: (DateTime selectDay,DateTime focusDay){
          setState(() {
            selectedDay =selectDay;
            focusedDay = focusDay;
          });
          print(focusedDay);
        },
        selectedDayPredicate: (DateTime date){
          return isSameDay(selectedDay,date);
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle
          ),
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0,
              color: Colors.orange,
            ),
          ),
          outsideDecoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),

        ),
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            switch(day.weekday){
              case 1:
                return Center(child: Text('월'),);
              case 2:
                return Center(child: Text('화'),);
              case 3:
                return Center(child: Text('수'),);
              case 4:
                return Center(child: Text('목'),);
              case 5:
                return Center(child: Text('금'),);
              case 6:
                return Center(child: Text('토',style: TextStyle(color: Colors.red),),);
              case 7:
                return Center(child: Text('일',style: TextStyle(color: Colors.red),),);
            }
          },
        ),
      ),));
  }
}
