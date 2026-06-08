// import 'package:flutter/material.dart';

// class ManageGroundsScreen extends StatefulWidget {
//   const ManageGroundsScreen({super.key});

//   @override
//   State<ManageGroundsScreen> createState() => _ManageGroundsScreenState();
// }

// class _ManageGroundsScreenState extends State<ManageGroundsScreen> {
//   int selectedTab = 0;

//   final grounds = [
//     {"name": "GROUND-A", "subtitle": "GROUND-A"},
//     {"name": "GROUND-B", "subtitle": "GROUND-B"},
//   ];

//   final sessions = [
//     {
//       "name": "Morning",
//       "ground": "GROUND-A",
//       "time": "06:00 - 12:00",
//       "enabled": true,
//     },
//     {
//       "name": "Afternoon",
//       "ground": "GROUND-A",
//       "time": "12:00 - 17:00",
//       "enabled": true,
//     },
//     {
//       "name": "Evening",
//       "ground": "GROUND-A",
//       "time": "17:00 - 22:00",
//       "enabled": true,
//     },
//     {
//       "name": "Night",
//       "ground": "GROUND-A",
//       "time": "22:00 - 03:59",
//       "enabled": true,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 16),

//             /// HEADER
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 14),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       width: 44,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: isDark
//                             ? Colors.white.withOpacity(.05)
//                             : Colors.black.withOpacity(.05),
//                       ),
//                       child: const Icon(Icons.chevron_left),
//                     ),
//                   ),

//                   const SizedBox(width: 16),

//                   Expanded(
//                     child: Text(
//                       selectedTab == 0
//                           ? "Manage Grounds"
//                           : selectedTab == 1
//                           ? "Manage Sessions"
//                           : "Manage Plans",
//                       style: const TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w800,
//                         letterSpacing: -2.75,
//                       ),
//                     ),
//                   ),

//                   Row(
//                     children: [
//                       Container(
//                         width: 44,
//                         height: 44,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: isDark
//                               ? Colors.white.withOpacity(.05)
//                               : Colors.black.withOpacity(.05),
//                         ),
//                         child: const Icon(
//                           Icons.search,
//                           color: Color(0xFFFF6B4A),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Container(
//                         width: 44,
//                         height: 44,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(0xFFFF6B4A),
//                         ),
//                         child: const Icon(Icons.add, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// TABS
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Container(
//                 height: 46,
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: isDark
//                       ? Colors.white.withOpacity(.05)
//                       : Colors.black.withOpacity(.05),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: Row(
//                   children: [
//                     _tab("Grounds", 0),
//                     _tab("Sessions", 1),
//                     _tab("Plans", 2),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// CONTENT CARD
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: isDark ? const Color(0xff111111) : Colors.white,
//                   ),
//                   // ✅ Only child here — no dangling itemBuilder/padding below
//                   child: selectedTab == 0
//                       ? _groundsView(isDark)
//                       : selectedTab == 1
//                       ? _sessionsView(isDark)
//                       : const Center(child: Text("Plans")),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _sessionsView(bool isDark) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(24),
//       itemCount: sessions.length,
//       separatorBuilder: (_, __) =>
//           Divider(height: 50, color: Colors.white.withOpacity(.08)),
//       itemBuilder: (_, index) {
//         final session = sessions[index];

//         return Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     session["name"].toString(),
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     session["ground"].toString(),
//                     style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     session["time"].toString(),
//                     style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
//                   ),
//                 ],
//               ),
//             ),
//             Switch(
//               value: session["enabled"] as bool,
//               activeColor: Colors.white,
//               activeTrackColor: const Color(0xFFFF6B4A),
//               onChanged: (value) {
//                 setState(() {
//                   sessions[index]["enabled"] = value;
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _groundsView(bool isDark) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(18),
//       itemCount: grounds.length,
//       separatorBuilder: (_, __) =>
//           Divider(height: 40, color: Colors.white.withOpacity(.08)),
//       itemBuilder: (_, index) {
//         final ground = grounds[index];

//         return Row(
//           children: [
//             Container(
//               width: 64,
//               height: 64,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.orange.withOpacity(.2),
//               ),
//               child: const Icon(Icons.image, color: Colors.orange),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     ground["name"]!,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     ground["subtitle"]!,
//                     style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _tab(String title, int index) {
//     final selected = selectedTab == index;

//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedTab = index;
//           });
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: selected
//                 ? Colors.white.withOpacity(.15)
//                 : Colors.transparent,
//           ),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 color: selected ? Colors.white : Colors.white70,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:acade360admin/Settings/add_plan.dart';
import 'package:flutter/material.dart';

class ManageGroundsScreen extends StatefulWidget {
  const ManageGroundsScreen({super.key});

  @override
  State<ManageGroundsScreen> createState() => _ManageGroundsScreenState();
}

class _ManageGroundsScreenState extends State<ManageGroundsScreen> {
  int selectedTab = 0;

  final grounds = [
    {"name": "GROUND-A", "subtitle": "GROUND-A"},
    {"name": "GROUND-B", "subtitle": "GROUND-B"},
  ];

  final sessions = [
    {
      "name": "Morning",
      "ground": "GROUND-A",
      "time": "06:00 - 12:00",
      "enabled": true,
    },
    {
      "name": "Afternoon",
      "ground": "GROUND-A",
      "time": "12:00 - 17:00",
      "enabled": true,
    },
    {
      "name": "Evening",
      "ground": "GROUND-A",
      "time": "17:00 - 22:00",
      "enabled": true,
    },
    {
      "name": "Night",
      "ground": "GROUND-A",
      "time": "22:00 - 03:59",
      "enabled": true,
    },
  ];

  final plans = [
    {
      "name": "Morning",
      "ground": "GROUND-A",
      "price": "\$6000.00",
      "duration": "3h",
      "time": "07:00 - 09:00",
      "enabled": true,
    },
    {
      "name": "Half-Day Morning",
      "ground": "GROUND-A",
      "price": "\$12000.00",
      "duration": "4h",
      "time": "09:00 - 13:00",
      "enabled": true,
    },
    {
      "name": "Full-Day",
      "ground": "GROUND-A",
      "price": "\$18000.00",
      "duration": "8h",
      "time": "09:00 - 17:00",
      "enabled": true,
    },
    {
      "name": "Evening",
      "ground": "GROUND-A",
      "price": "\$8000.00",
      "duration": "3h",
      "time": "17:00 - 20:00",
      "enabled": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark
                            ? Colors.white.withOpacity(.05)
                            : Colors.black.withOpacity(.05),
                      ),
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      selectedTab == 0
                          ? "Manage Grounds"
                          : selectedTab == 1
                          ? "Manage Sessions"
                          : "Manage Plans",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.86,
                      ),
                    ),
                  ),
                  Row(
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
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFFFF6B4A),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const AddPlanSheet(),
                          );
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF6B4A),
                          ),
                          child: const Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// TABS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 46,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withOpacity(.05)
                      : Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    _tab("Grounds", 0),
                    _tab("Sessions", 1),
                    _tab("Plans", 2),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// CONTENT CARD
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDark ? const Color(0xff111111) : Colors.white,
                  ),
                  child: selectedTab == 0
                      ? _groundsView(isDark)
                      : selectedTab == 1
                      ? _sessionsView(isDark)
                      : _plansView(isDark),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ─── PLANS VIEW ───────────────────────────────────────────────
  Widget _plansView(bool isDark) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      itemCount: plans.length,
      separatorBuilder: (_, __) => Divider(
        height: 52,
        color: isDark
            ? Colors.white.withOpacity(.07)
            : Colors.black.withOpacity(.07),
      ),
      itemBuilder: (_, index) {
        final plan = plans[index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Left: text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plan name
                  Text(
                    plan["name"].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Ground
                  Text(
                    plan["ground"].toString(),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Price + duration on same row
                  Row(
                    children: [
                      Text(
                        plan["price"].toString(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        plan["duration"].toString(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Time range
                  Text(
                    plan["time"].toString(),
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),

            /// Right: toggle
            Switch(
              value: plan["enabled"] as bool,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFFFF6B4A),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade700,
              onChanged: (value) {
                setState(() {
                  plans[index]["enabled"] = value;
                });
              },
            ),
          ],
        );
      },
    );
  }

  /// ─── SESSIONS VIEW ────────────────────────────────────────────
  Widget _sessionsView(bool isDark) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: sessions.length,
      separatorBuilder: (_, __) =>
          Divider(height: 50, color: Colors.white.withOpacity(.08)),
      itemBuilder: (_, index) {
        final session = sessions[index];

        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session["name"].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    session["ground"].toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    session["time"].toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Switch(
              value: session["enabled"] as bool,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFFFF6B4A),
              onChanged: (value) {
                setState(() {
                  sessions[index]["enabled"] = value;
                });
              },
            ),
          ],
        );
      },
    );
  }

  /// ─── GROUNDS VIEW ─────────────────────────────────────────────
  Widget _groundsView(bool isDark) {
    return ListView.separated(
      padding: const EdgeInsets.all(18),
      itemCount: grounds.length,
      separatorBuilder: (_, __) =>
          Divider(height: 40, color: Colors.white.withOpacity(.08)),
      itemBuilder: (_, index) {
        final ground = grounds[index];

        return Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.orange.withOpacity(.2),
              ),
              child: const Icon(Icons.image, color: Colors.orange),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ground["name"]!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ground["subtitle"]!,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /// ─── TAB WIDGET ───────────────────────────────────────────────
  Widget _tab(String title, int index) {
    final selected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selected
                ? Colors.white.withOpacity(.15)
                : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
