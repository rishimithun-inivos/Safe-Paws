import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:time/time.dart';
import 'package:intl/intl.dart';

class CalendarViewModel extends ChangeNotifier{
  List<DateTime?>? updatedDates = [DateTime.now() - 30.days, DateTime.now()];
  String displayCalendarStartDate = DateFormat('dd-MM-yyyy').format(DateTime.now());


  init() {}

  displayCalendar(BuildContext context) async{
    updatedDates = await showCalendarDatePicker2Dialog(
        context: context,
        config: CalendarDatePicker2WithActionButtonsConfig(
          firstDate: DateTime.now(),
          lastDate: DateTime.now() + (30.days * 6),
          calendarType: CalendarDatePicker2Type.single,
          closeDialogOnOkTapped: true,
          closeDialogOnCancelTapped: false,
        ),
        dialogSize: Size(350, 400),
        barrierDismissible: false,
    );
    notifyListeners();
    displayCalendarStartDate = DateFormat('dd-MM-yyyy').format(updatedDates?[0] ?? DateTime.now());
  }
}
