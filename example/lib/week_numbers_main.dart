import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:week_of_year/week_of_year.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatePicker2Example()
    );
  }
}
class DatePicker2Example extends StatefulWidget {
  const DatePicker2Example({Key? key}) : super(key: key);

  @override
  State<DatePicker2Example> createState() => _DatePicker2ExampleState();
}

class _DatePicker2ExampleState extends State<DatePicker2Example> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = (await Navigator.push(
                    context,
                    MaterialPageRoute<DateTime>(builder: (context) => DatePicker(initialDate: _selectedDate)),
                  ))!;
                  setState(() {
                    _selectedDate = result;
                  });
                },
                child: Text(_selectedDate.toString().split(' ').first),
              ),
              ElevatedButton(
                onPressed: () async {
                  final values = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      weekNumbers: true,
                      weekNumberLabel: 'Kw',
                    ),
                    dialogSize: const Size(400, 400),
                    borderRadius: BorderRadius.circular(15),
                    value: [_selectedDate],
                    dialogBackgroundColor: Colors.white,
                  );
                  if (values != null) {
                    setState(() {
                      _selectedDate = values[0]!;
                    });
                  }
                },
                child: Text('Kw ${_selectedDate.weekOfYear}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  final DateTime initialDate;

  const DatePicker({required this.initialDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Date"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop<DateTime>(context, initialDate),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.blue[50],
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(),
            value: [initialDate],
            onValueChanged: (selectedDates) {
              Navigator.pop<DateTime>(context, selectedDates[0]);
            },
          ),
          // child: CalendarDatePicker(
          //   initialDate: initialDate,
          //   firstDate: DateTime(2021),
          //   lastDate: DateTime(2025),
          //   onDateChanged: (DateTime selectedDate) {
          //     Navigator.pop<DateTime>(context, selectedDate);
          //   },
          // ),
        ),
      ),
    );
  }
}