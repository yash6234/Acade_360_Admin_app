import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> attendanceList = [
    {
      "name": "prakash",
      "rollNo": "STA25001",
      "date": "05/06/26",
      "status": "Absent",
    },
    {
      "name": "jigo",
      "rollNo": "STA25002",
      "date": "05/06/26",
      "status": "Absent",
    },
    {
      "name": "lakshman mina",
      "rollNo": "STA25003",
      "date": "05/06/26",
      "status": "Absent",
    },
    {
      "name": "rakesh",
      "rollNo": "STA25005",
      "date": "05/06/26",
      "status": "Absent",
    },
    {
      "name": "prakash",
      "rollNo": "STA25001",
      "date": "04/06/26",
      "status": "Absent",
    },
  ];

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  Color get cardColor => isDark ? const Color(0xFF18181B) : Colors.white;

  Color get borderColor =>
      isDark ? Colors.white.withOpacity(.06) : Colors.black.withOpacity(.06);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 51, 50, 50).withOpacity(0.15),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: const Icon(
          Icons.qr_code_scanner_rounded,
          color: Color(0xFFFF6B4A),
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              _header(),

              const SizedBox(height: 20),

              _topControls(),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: attendanceList.length,
                  itemBuilder: (_, index) {
                    return _attendanceCard(attendanceList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Attendance",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),

        _circleButton(Icons.search),

        const SizedBox(width: 10),

        _circleButton(Icons.more_horiz),
      ],
    );
  }

  Widget _topControls() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: selectedTab == 0
                            ? Colors.white.withOpacity(.10)
                            : Colors.transparent,
                      ),
                      child: const Center(child: Text("Today")),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: selectedTab == 1
                            ? Colors.white.withOpacity(.10)
                            : Colors.transparent,
                      ),
                      child: const Center(child: Text("All")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        _circleButton(Icons.segment_rounded),
        const SizedBox(width: 10),

        _circleButton(CupertinoIcons.calendar),
      ],
    );
  }

  Widget _attendanceCard(Map<String, dynamic> attendance) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? Colors.white.withOpacity(.05)
                  : Colors.black.withOpacity(.05),
            ),
            child: const Icon(Icons.close, color: Colors.grey),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attendance["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 6),

                Text("Roll No: ${attendance["rollNo"]}"),

                const SizedBox(height: 4),

                Text("Date: ${attendance["date"]}"),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(.05)
                  : Colors.black.withOpacity(.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              attendance["status"],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: cardColor,
        border: Border.all(color: borderColor),
      ),
      child: Icon(icon),
    );
  }
}
