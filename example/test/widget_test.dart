// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_of_year/week_of_year.dart';
import 'package:date_checker/date_checker.dart';
import 'package:intl/intl.dart';


import 'package:example/main.dart';

void main() {
    test('DateTime.weekOfYear', () {
      final today = DateTime.now();
      print(today.weekOfYear); // Get the iso week of year
      print(today.ordinalDate); // Get the ordinal today
      print(today.isLeapYear); // Is this a leap year?
      print(DateFormat("y-MM-dd").format(today));

      final DateTime dateFromWeekNumber = dateTimeFromWeekNumber(today.year, today.weekOfYear, today.weekday);
      expect(
        DateFormat("yyyy-MM-dd").format(dateFromWeekNumber), 
        DateFormat("yyyy-MM-dd").format(today));

      print('weekStart : ${weekStart(date: today)}');
      print('weekEnd : ${weekEnd(date: today)}');
      print('weekOfYear 01/04 : ${DateTime(today.year, 1, 4).weekOfYear}');
      print('weekOfYear 12/28 : ${DateTime(today.year, 12, 28).weekOfYear}');
      expect(DateTime(2020, 12, 28).weekOfYear, 53);
    });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
