import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 480),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          // <- now properly aligned
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCalendarSection(),
            _buildBottomDivider(),
            const SizedBox(height: 19),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      color: const Color.fromRGBO(222, 240, 211, 0.23),
      child: Center(
        // 👈 added this
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 68),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Text(
                  'Events Calendar',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SF Pro Display',
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: const Offset(4, 3),
                        blurRadius: 7,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 39),
            _buildMonthSelector(),
            const SizedBox(height: 19),
            _buildCalendarGrid(),
            const SizedBox(height: 50),
            _buildEventCard(
              time: '11:00',
              title: "Designer's Meeting",
              description:
                  'Discussion regarding new changes in design and user flow',
            ),
            const SizedBox(height: 28),
            _buildEventCard(
              time: '13:00',
              title: "Developer's Meeting",
              description: 'Ideating the designs and flow for the app',
            ),
            const SizedBox(height: 28),
            _buildEventCard(
              time: '15:00',
              title: 'General Meeting',
              description:
                  "Daily status report and upcoming project's discussion",
            ),
            const SizedBox(height: 91),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return SizedBox(
      width: 191,
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              'APRIL 2025',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return Container(
      width: 362,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(222, 240, 211, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 11,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildWeekdayHeader(),
          const SizedBox(height: 25),
          _buildFirstWeekRow(),
          const SizedBox(height: 21),
          _buildWeekRow(['6', '7', '8', '9', '10', '11', '12']),
          const SizedBox(height: 21),
          _buildWeekRow(['13', '14', '15', '16', '17', '18', '19']),
          const SizedBox(height: 22),
          _buildWeekRow(['20', '21', '22', '23', '24', '25', '26']),
          const SizedBox(height: 21),
          _buildLastWeekRow(),
        ],
      ),
    );
  }

  Widget _buildWeekdayHeader() {
    final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weekdays
            .map((day) => Text(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildFirstWeekRow() {
    return Padding(
      padding: const EdgeInsets.only(right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDayText('1'),
          const SizedBox(width: 40),
          _buildDayText('2'),
          const SizedBox(width: 40),
          _buildDayText('3'),
          const SizedBox(width: 40),
          _buildDayText('4'),
          const SizedBox(width: 40),
          _buildDayText('5'),
        ],
      ),
    );
  }

  Widget _buildWeekRow(List<String> days) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((day) => _buildDayText(day)).toList(),
      ),
    );
  }

  Widget _buildLastWeekRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildDayText('27'),
          const SizedBox(width: 35),
          _buildDayText('28'),
          const SizedBox(width: 35),
          _buildDayText('29'),
          const SizedBox(width: 35),
          _buildDayText('30'),
          const SizedBox(width: 35),
          _buildDayText('31'),
        ],
      ),
    );
  }

  Widget _buildDayText(String day) {
    return Text(
      day,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEventCard({
    required String time,
    required String title,
    required String description,
  }) {
    return Container(
      width: 362,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(174, 216, 149, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 9,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 36,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 9),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomDivider() {
    return Container(
      width: 357,
      height: 42, // Approximate height based on aspect ratio
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      ),
    );
  }
}
