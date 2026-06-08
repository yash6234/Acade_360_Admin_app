import 'package:acade360admin/Settings/settings_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),

              const SizedBox(height: 20),

              _commandCenter(),

              const SizedBox(height: 20),

              _actionGrid(),

              const SizedBox(height: 20),

              _analyticsTabs(),

              const SizedBox(height: 20),

              const Text(
                "Executive Summary",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Real numbers from admissions, finance, and operations.",
                style: TextStyle(color: Colors.white54),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: _summaryCard()),
                  const SizedBox(width: 14),
                  Expanded(child: _summaryCard()),
                ],
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
        const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Acade360",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),

              Text(
                "Updated 11:48 AM",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white10,
          child: Icon(Icons.notifications_none),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SettingsScreen()),
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white10,
            child: Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  Widget _commandCenter() {
    return Container(
      padding: const EdgeInsets.all(18),
      // height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 83, 61, 59), Color(0xFF121720)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6B4A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.bolt_rounded,
                  size: 10,
                  color: Colors.black,
                ),
              ),

              const SizedBox(width: 8),

              const Text(
                "Command Center",
                style: TextStyle(
                  color: Color(0xFFFF6B4A),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Today",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 2),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B4A), Color(0xFFFF8A65)],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "A",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: statCard("Revenue", "₹29.8K")),
              SizedBox(width: 10),
              Expanded(child: statCard("Collection", "100%")),
              SizedBox(width: 10),
              Expanded(child: statCard("Attention", "16")),
            ],
          ),
        ],
      ),
    );
  }

  Widget statCard(String title, String value) {
    return Container(
      // height: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _actionGrid() {
    final items = [
      {
        "title": "Add Student",
        "icon": Icons.person_add_alt_1,
        "color": const Color(0xFFFF6B4A),
      },
      {
        "title": "Attendance",
        "icon": Icons.groups_2_outlined,
        "color": const Color(0xFF00C27A),
      },
      {
        "title": "Scan ID",
        "icon": Icons.qr_code_scanner,
        "color": const Color(0xFFFF9800),
      },
      {
        "title": "Inventory",
        "icon": Icons.inventory_2_outlined,
        "color": const Color(0xFF0066FF),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.9,
      ),
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff0B0B0B),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(.05)),
          ),
          // child: Center(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 14),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 40,
          //           height: 40,
          //           decoration: BoxDecoration(
          //             color: (items[index]["color"] as Color).withOpacity(.15),
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //           child: Icon(
          //             items[index]["icon"] as IconData,
          //             color: items[index]["color"] as Color,
          //             size: 20,
          //           ),
          //         ),

          //         const SizedBox(width: 12),

          //         Expanded(
          //           child: Text(
          //             items[index]["title"] as String,
          //             style: const TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: (items[index]["color"] as Color).withOpacity(.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    items[index]["icon"] as IconData,
                    color: items[index]["color"] as Color,
                    size: 20,
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    items[index]["title"] as String,

                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _analyticsTabs() {
    return Row(
      children: [
        Expanded(child: tab("Today", true)),
        SizedBox(width: 10),
        Expanded(child: tab("30D", false)),
        SizedBox(width: 10),
        Expanded(child: tab("90D", false)),
      ],
    );
  }

  Widget tab(String title, bool active) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFFF6B4A) : const Color(0xff151515),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: Text(title)),
    );
  }

  Widget _summaryCard() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xff111111),
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
