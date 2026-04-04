import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/time_helper.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int selectedIndex = 5;

  final dates = getDaysListInMonth(2024, 3);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => setState(() {
              selectedIndex = index;
            }),
            child: Container(
              width: 55,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                // color: Colors.grey,
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat('E').format(date),
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  gapH8,
                  Text(
                    DateFormat('d').format(date),
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  gapH4,
                  Container(
                    width: Sizes.p4,
                    height: Sizes.p4,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
