import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {},
            activeColor: const Color(0xffFFBF9B),
            headerProps: const EasyHeaderProps(
              showSelectedDate: false,
              monthPickerType: MonthPickerType.switcher,
              dateFormatter: DateFormatter.monthOnly(),
            ),
            dayProps: const EasyDayProps(
              todayStyle: DayStyle(
                  dayNumStyle: TextStyle(color: Colors.white, fontSize: 18)),
              height: 56.0,
              width: 56.0,
              dayStructure: DayStructure.dayNumDayStr,
              inactiveDayStyle: DayStyle(
                borderRadius: 48.0,
                dayNumStyle: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              activeDayStyle: DayStyle(
                dayNumStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
