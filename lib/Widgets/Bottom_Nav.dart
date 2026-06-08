// // // import 'package:acade360admin/Accounts/Accounts_screen.dart';
// // // import 'package:acade360admin/Admission/Admission_Screen.dart';
// // // import 'package:acade360admin/Attendence/Attendance_screen.dart';
// // // import 'package:acade360admin/Bookings/Booking_screen.dart';
// // // import 'package:acade360admin/Dashboard/Dashboard_screen.dart';
// // // import 'package:flutter/material.dart';

// // // class BottomNavScreen extends StatefulWidget {
// // //   const BottomNavScreen({super.key});

// // //   @override
// // //   State<BottomNavScreen> createState() => _BottomNavScreenState();
// // // }

// // // class _BottomNavScreenState extends State<BottomNavScreen> {
// // //   int selectedIndex = 0;

// // //   final List<Widget> screens = [
// // //     const DashboardScreen(),
// // //     const AdmissionScreen(),
// // //     const AttendanceScreen(),
// // //     const BookingScreen(),
// // //     const AccountsScreen(),
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: screens[selectedIndex],

// // //       bottomNavigationBar: Container(
// // //         height: 78,
// // //         margin: const EdgeInsets.all(12),
// // //         decoration: BoxDecoration(
// // //           color: const Color(0xff111111),
// // //           borderRadius: BorderRadius.circular(28),
// // //           border: Border.all(color: Colors.white.withOpacity(.05)),
// // //         ),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //           children: [
// // //             navItem(Icons.home_outlined, "Home", 0),
// // //             navItem(Icons.groups_outlined, "Admission", 1),
// // //             navItem(Icons.calendar_month_outlined, "Attendance", 2),
// // //             navItem(Icons.event_note_outlined, "Booking", 3),
// // //             navItem(Icons.account_balance_wallet_outlined, "Accounts", 4),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget navItem(IconData icon, String title, int index) {
// // //     bool selected = selectedIndex == index;

// // //     return InkWell(
// // //       onTap: () {
// // //         setState(() {
// // //           selectedIndex = index;
// // //         });
// // //       },
// // //       child: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           Icon(
// // //             icon,
// // //             color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
// // //           ),
// // //           const SizedBox(height: 4),
// // //           Text(
// // //             title,
// // //             style: TextStyle(
// // //               fontSize: 11,
// // //               color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'dart:ui';

// // import 'package:acade360admin/Accounts/Accounts_screen.dart';
// // import 'package:acade360admin/Admission/Admission_Screen.dart';
// // import 'package:acade360admin/Attendence/Attendance_screen.dart';
// // import 'package:acade360admin/Bookings/Booking_screen.dart';
// // import 'package:acade360admin/Dashboard/Dashboard_screen.dart';
// // import 'package:flutter/material.dart';

// // class BottomNavScreen extends StatefulWidget {
// //   const BottomNavScreen({super.key});

// //   @override
// //   State<BottomNavScreen> createState() => _BottomNavScreenState();
// // }

// // class _BottomNavScreenState extends State<BottomNavScreen> {
// //   int selectedIndex = 0;

// //   final List<Widget> screens = [
// //     const DashboardScreen(),
// //     const AdmissionScreen(),
// //     const AttendanceScreen(),
// //     const BookingScreen(),
// //     const AccountsScreen(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // ✅ Let body extend behind the floating nav bar
// //       extendBody: true,
// //       body: screens[selectedIndex],

// //       bottomNavigationBar: _buildFloatingNavBar(),
// //     );
// //   }

// //   Widget _buildFloatingNavBar() {
// //     return Container(
// //       // Outer margin makes it "float" above the screen edge
// //       margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
// //       height: 78,
// //       child: ClipRRect(
// //         borderRadius: BorderRadius.circular(28),
// //         child: BackdropFilter(
// //           // ✅ Frosted glass blur on whatever is behind the nav bar
// //           filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
// //           child: Container(
// //             decoration: BoxDecoration(
// //               // Semi-transparent dark fill — adjust opacity for more/less glass
// //               color: Colors.black.withOpacity(0.55),
// //               borderRadius: BorderRadius.circular(28),
// //               border: Border.all(color: Colors.white.withOpacity(.08)),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 _navItem(Icons.home_outlined, "Home", 0),
// //                 _navItem(Icons.groups_outlined, "Admission", 1),
// //                 _navItem(Icons.calendar_month_outlined, "Attendance", 2),
// //                 _navItem(Icons.event_note_outlined, "Booking", 3),
// //                 _navItem(Icons.account_balance_wallet_outlined, "Accounts", 4),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _navItem(IconData icon, String title, int index) {
// //     final bool selected = selectedIndex == index;

// //     return InkWell(
// //       onTap: () => setState(() => selectedIndex = index),
// //       borderRadius: BorderRadius.circular(12),
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(
// //               icon,
// //               color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
// //               size: 24,
// //             ),
// //             const SizedBox(height: 4),
// //             Text(
// //               title,
// //               style: TextStyle(
// //                 fontSize: 11,
// //                 color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
// //                 fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:ui';

// import 'package:acade360admin/Accounts/Accounts_screen.dart';
// import 'package:acade360admin/Admission/Admission_Screen.dart';
// import 'package:acade360admin/Attendence/Attendance_screen.dart';
// import 'package:acade360admin/Bookings/Booking_screen.dart';
// import 'package:acade360admin/Dashboard/Dashboard_screen.dart';
// import 'package:flutter/material.dart';

// class BottomNavScreen extends StatefulWidget {
//   const BottomNavScreen({super.key});

//   @override
//   State<BottomNavScreen> createState() => _BottomNavScreenState();
// }

// class _BottomNavScreenState extends State<BottomNavScreen> {
//   int selectedIndex = 0;

//   final List<Widget> screens = [
//     const DashboardScreen(),
//     const AdmissionScreen(),
//     const AttendanceScreen(),
//     const BookingScreen(),
//     const AccountsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ✅ Let body extend behind the floating nav bar
//       extendBody: true,
//       body: screens[selectedIndex],

//       bottomNavigationBar: _buildFloatingNavBar(),
//     );
//   }

//   Widget _buildFloatingNavBar() {
//     return Container(
//       // Outer margin makes it "float" above the screen edge
//       margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
//       height: 78,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(28),
//         child: BackdropFilter(
//           // ✅ Frosted glass blur on whatever is behind the nav bar
//           filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//           child: Container(
//             decoration: BoxDecoration(
//               // Semi-transparent dark fill — adjust opacity for more/less glass
//               color: Colors.black.withOpacity(0.55),
//               borderRadius: BorderRadius.circular(28),
//               border: Border.all(color: Colors.white.withOpacity(.08)),
//             ),
//             child: Row(
//               children: [
//                 Expanded(child: _navItem(Icons.home_outlined, "Home", 0)),
//                 Expanded(
//                   child: _navItem(Icons.groups_outlined, "Admission", 1),
//                 ),
//                 Expanded(
//                   child: _navItem(
//                     Icons.calendar_month_outlined,
//                     "Attendance",
//                     2,
//                   ),
//                 ),
//                 Expanded(
//                   child: _navItem(Icons.event_note_outlined, "Booking", 3),
//                 ),
//                 Expanded(
//                   child: _navItem(
//                     Icons.account_balance_wallet_outlined,
//                     "Accounts",
//                     4,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _navItem(IconData icon, String title, int index) {
//     final bool selected = selectedIndex == index;

//     return InkWell(
//       onTap: () => setState(() => selectedIndex = index),
//       borderRadius: BorderRadius.circular(12),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
//               size: 24,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
//                 fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:acade360admin/Accounts/Accounts_screen.dart';
import 'package:acade360admin/Admission/Admission_Screen.dart';
import 'package:acade360admin/Attendence/Attendance_screen.dart';
import 'package:acade360admin/Bookings/Booking_screen.dart';
import 'package:acade360admin/Dashboard/Dashboard_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const DashboardScreen(),
    const AdmissionScreen(),
    const AttendanceScreen(),
    const BookingScreen(),
    const AccountsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Let body extend behind the floating nav bar
      extendBody: true,
      body: screens[selectedIndex],

      bottomNavigationBar: _buildFloatingNavBar(),
    );
  }

  Widget _buildFloatingNavBar() {
    return Container(
      // Outer margin makes it "float" above the screen edge
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      height: 78,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          // ✅ Frosted glass blur on whatever is behind the nav bar
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              // Semi-transparent dark fill — adjust opacity for more/less glass
              color: Colors.black.withOpacity(0.55),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withOpacity(.08)),
            ),
            child: Row(
              children: [
                Expanded(child: _navItem(Icons.home_outlined, "Home", 0)),
                Expanded(
                  child: _navItem(Icons.groups_outlined, "Admission", 1),
                ),
                Expanded(
                  child: _navItem(
                    Icons.calendar_month_outlined,
                    "Attendance",
                    2,
                  ),
                ),
                Expanded(
                  child: _navItem(Icons.event_note_outlined, "Booking", 3),
                ),
                Expanded(
                  child: _navItem(
                    Icons.account_balance_wallet_outlined,
                    "Accounts",
                    4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String title, int index) {
    final bool selected = selectedIndex == index;

    return InkWell(
      onTap: () => setState(() => selectedIndex = index),
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // ✅ shrink-wrap, don't stretch
          children: [
            Icon(
              icon,
              color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
              size: 20, // ✅ reduced from 22
            ),
            const SizedBox(height: 2), // ✅ reduced from 4
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: selected ? const Color(0xFFFF6B4A) : Colors.white70,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
