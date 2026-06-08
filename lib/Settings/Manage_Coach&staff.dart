import 'package:flutter/material.dart';

class StaffCoachesScreen extends StatefulWidget {
  const StaffCoachesScreen({super.key});

  @override
  State<StaffCoachesScreen> createState() => _StaffCoachesScreenState();
}

class _StaffCoachesScreenState extends State<StaffCoachesScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> staffList = [
    {
      "name": "rakesh",
      "phone": "9624...3623",
      "staffId": "STA25005",
      "uuid": "UUID 10",
    },
    {
      "name": "lakshman",
      "phone": "8097...6862",
      "staffId": "STA25003",
      "uuid": "UUID 15",
    },
    {
      "name": "jigo",
      "phone": "962...05749",
      "staffId": "STA25002",
      "uuid": "UUID 12",
    },
    {
      "name": "prakash",
      "phone": "9033...9008",
      "staffId": "STA25001",
      "uuid": "UUID 08",
    },
  ];

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  Color get cardColor => isDark ? const Color(0xFF18181B) : Colors.white;

  Color get borderColor =>
      isDark ? Colors.white.withOpacity(.06) : Colors.black.withOpacity(.06);

  Color get textColor => isDark ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              _header(),

              const SizedBox(height: 24),

              _topTabs(),

              const SizedBox(height: 20),

              _sectionTitle(),

              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: staffList.length,
                  itemBuilder: (_, index) {
                    return _staffCard(staffList[index]);
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
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: _circleButton(Icons.chevron_left),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            "Staff & Coaches",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),

        _circleButton(Icons.search),

        const SizedBox(width: 10),

        Container(
          width: 46,
          height: 46,
          decoration: const BoxDecoration(
            color: Color(0xFFFF6B4A),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }

  Widget _topTabs() {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
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
                  color: selectedTab == 0
                      ? Colors.white.withOpacity(.08)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Staff",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
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
                  color: selectedTab == 1
                      ? Colors.white.withOpacity(.08)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Coaches",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle() {
    return Row(
      children: const [
        Icon(Icons.groups_rounded, color: Color(0xFFFF6B4A), size: 20),
        SizedBox(width: 8),
        Text(
          "Staff",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _staffCard(Map<String, dynamic> staff) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xFFFF6B4A).withOpacity(.20),
                    ),
                    child: Center(
                      child: Text(
                        staff["name"][0].toString().toUpperCase(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: -2,
                    bottom: -2,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Flexible(
                            child: Text(
                              staff["name"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B4A).withOpacity(.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Staff",
                            style: TextStyle(
                              color: Color(0xFFFF6B4A),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        const Icon(Icons.call, size: 16, color: Colors.grey),

                        const SizedBox(width: 4),

                        Expanded(
                          child: Text(
                            staff["phone"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified, size: 16, color: Colors.green),
                    SizedBox(width: 6),
                    Text(
                      "Active",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(child: _infoChip(Icons.tag, staff["staffId"])),

              const SizedBox(width: 8),

              Expanded(child: _infoChip(Icons.badge_outlined, staff["uuid"])),

              const SizedBox(width: 6),

              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTapDown: (details) async {
                      final result = await showMenu(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        context: context,
                        color: const Color(0xFF1E1E1E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        position: RelativeRect.fromLTRB(
                          details.globalPosition.dx,
                          details.globalPosition.dy,
                          20,
                          0,
                        ),
                        items: const [
                          PopupMenuItem(
                            value: 'inactive',
                            child: Text(
                              'Mark Inactive',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      );

                      switch (result) {
                        case 'inactive':
                          debugPrint('Mark Inactive');
                          break;

                        case 'edit':
                          debugPrint('Edit');
                          break;

                        case 'delete':
                          debugPrint('Delete');
                          break;
                      }
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.05),
                      ),
                      child: const Icon(Icons.more_horiz, size: 20),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.04),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: cardColor,
        border: Border.all(color: borderColor),
      ),
      child: Icon(icon, color: textColor),
    );
  }
}
