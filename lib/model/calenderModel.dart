import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class EventModel extends ChangeNotifier {
  String title;

  EventModel(this.title);

  @override
  String toString() => title;
}

final kToday = DateTime.now().toLocal();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class calendarModel extends ChangeNotifier {
  DateTime _focusedDay = DateTime.now().toUtc();
  DateTime? _selectedDay;
  List<EventModel>? _selectedEvents;
  final _events = LinkedHashMap<DateTime, List<EventModel>> (
      equals:isSameDay,
      hashCode: getHashCode)..addAll({
    DateTime.utc(2022, 06, 07): [EventModel('hi')],
    DateTime.utc(2022, 06, 08): [EventModel('hi')]
  });

  get focusedDay => _focusedDay;
  get selectedDay => _selectedDay;
  get selectedEvents => _selectedEvents;
  get onDaySelected => _onDaySelected;
  get events => _events;
  get getEventsForDay => _getEventsForDay;

  calendarModel() {
    _selectedDay = _focusedDay.toUtc();
    _selectedEvents = _events[_selectedDay?.toUtc()]??[];
    notifyListeners();
  }

  _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      notifyListeners();
    }
    _selectedEvents = _events[_selectedDay]??[];
    notifyListeners();
  }

  List<EventModel> _getEventsForDay(DateTime day) {

    return _events[day] ?? [];
  }
}