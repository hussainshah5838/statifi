import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import 'package:intl/intl.dart';

class TradingCalendar extends StatefulWidget {
  @override
  State<TradingCalendar> createState() => TradingCalendarState();
}

class TradingCalendarState extends State<TradingCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Example trading events
  final Map<DateTime, String> _events = {
    DateTime.utc(2025, 12, 2): 'Buy',
    DateTime.utc(2025, 12, 5): 'Sell',
    DateTime.utc(2025, 12, 10): 'Buy',
    DateTime.utc(2025, 12, 12): 'Sell',
    DateTime.utc(2025, 12, 14): 'Special',
    DateTime.utc(2025, 12, 16): 'Buy',
    DateTime.utc(2025, 12, 20): 'Sell',
  };

  Color? _getEventColor(DateTime day) {
    final event = _events[DateTime.utc(day.year, day.month, day.day)];
    if (event == 'Buy') return AppColors.textGreen.withOpacity(0.5);
    if (event == 'Sell') return Color(0xFFFF4232).withOpacity(0.4);
    if (event == 'Special') return AppColors.textAmber.withOpacity(0.8);
    return null;
  }

  void _onPrevMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
    });
  }

  void _onNextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final monthYear = DateFormat('MMMM yyyy').format(_focusedDay);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.calendar, width: 24),
              const SizedBox(width: 10),
              Text(
                'Trading Calendar',
                style: AppTextStyles.title.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 14),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black38,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _onPrevMonth,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  monthYear,
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _onNextMonth,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.textWhite,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// Calendar
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            headerVisible: false,
            rowHeight: 45,
            daysOfWeekHeight: 25,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.textPrimary,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: AppTextStyles.title.copyWith(
                fontSize: 13,
                color: AppColors.textWhite,
              ),
              weekendTextStyle: AppTextStyles.title.copyWith(
                fontSize: 13,
                color: AppColors.textWhite,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final color = _getEventColor(day);
                return Center(
                  child: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 13,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                );
              },
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
        ],
      ),
    );
  }
}
