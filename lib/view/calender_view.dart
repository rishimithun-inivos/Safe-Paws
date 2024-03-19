import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:safe_paws/viewmodel/calendar_view_model.dart';


class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => CalendarViewState();
}

class CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
        viewModelBuilder: () => CalendarViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(39, 130, 142, 1.0),
              elevation: 5,
              shadowColor: Colors.grey,
              centerTitle: true,
              title: Center(
                child: Text(
                  "See you again on...",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SizedBox(width: 10),
                  Text(
                    viewModel.displayCalendarStartDate,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PoppinsMedium',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () async {
                      await viewModel.displayCalendar(context);
                    },
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      size: 40,
                    ),
                  ),
                ]),
                )],
            ),
          );
        });
  }
}
