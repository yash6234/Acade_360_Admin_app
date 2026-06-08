import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdmissionScreen extends StatefulWidget {
  const AdmissionScreen({super.key});

  @override
  State<AdmissionScreen> createState() => _AdmissionScreenState();
}

class _AdmissionScreenState extends State<AdmissionScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> students = [
    {
      "name": "Kaushal Maheshwari",
      "phone": "9429226466",
      "id": "20260538",
      "status": "ACTIVE",
      "days": "30 days left",
      "batch": "Evening",
    },
    {
      "name": "Vivan Chaudhary",
      "phone": "8780874585",
      "id": "20260537",
      "status": "ACTIVE",
      "days": "30 days left",
      "batch": "Evening",
    },
    {
      "name": "Smit Patel",
      "phone": "9328004919",
      "id": "20260536",
      "status": "ACTIVE",
      "days": "30 days left",
      "batch": "Morning",
    },
  ];

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  Color get cardColor => isDark ? const Color(0xFF18181B) : Colors.white;

  Color get borderColor =>
      isDark ? Colors.white.withOpacity(.06) : Colors.black.withOpacity(.06);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF6B4A),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              _header(),

              const SizedBox(height: 16),

              _topTabs(),

              const SizedBox(height: 20),

              _titleSection(),

              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (_, index) {
                    return _studentCard(students[index]);
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
            "Academy",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),

        _circleButton(Icons.search_rounded),

        const SizedBox(width: 10),

        _circleButton(CupertinoIcons.calendar),

        const SizedBox(width: 10),

        _circleButton(Icons.more_horiz),
      ],
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

  Widget _topTabs() {
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
                        color: selectedTab == 0
                            ? Colors.white.withOpacity(.08)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: Text("Students")),
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
                      child: const Center(child: Text("Inquiry")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 12),

        _circleButton(Icons.segment_rounded),
      ],
    );
  }

  Widget _titleSection() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Academy Students",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),

        _circleButton(Icons.chevron_left),

        const SizedBox(width: 8),

        Text(
          "1 of 46",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(width: 8),

        _circleButton(Icons.chevron_right),
      ],
    );
  }

  Widget _activeBadge(String text) {
    return ClipPath(
      clipper: StatusClipper(),
      child: Container(
        width: 72,
        height: 28,
        color: const Color(0xFF2E8B57),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _studentCard(Map<String, dynamic> student) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      // child: Row(
      //   children: [
      //     CircleAvatar(
      //       radius: 24,
      //       backgroundColor: const Color(0xFFFF6B4A),
      //       child: Text(
      //         student["name"][0],
      //         style: const TextStyle(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),

      //     const SizedBox(width: 12),

      //     Expanded(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             student["name"],

      //             overflow: TextOverflow.visible,
      //             style: const TextStyle(
      //               fontWeight: FontWeight.w700,
      //               fontSize: 14,
      //             ),
      //           ),

      //           const SizedBox(height: 2),
      //           Row(
      //             children: [
      //               const Icon(Icons.call, size: 14, color: Color(0xFFFF6B4A)),

      //               const SizedBox(width: 6),
      //               Text(student["phone"]),
      //             ],
      //           ),

      //           const SizedBox(height: 2),
      //           Container(
      //             padding: const EdgeInsets.symmetric(
      //               horizontal: 10,
      //               vertical: 5,
      //             ),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               color: isDark
      //                   ? Colors.white.withOpacity(.05)
      //                   : Colors.black.withOpacity(.05),
      //             ),
      //             child: Text("# ${student["id"]}"),
      //           ),
      //         ],
      //       ),
      //     ),

      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         ClipPath(
      //           clipper: StatusClipper(),
      //           child: Container(
      //             width: 78,
      //             height: 28,
      //             color: const Color(0xFF2E8B57),
      //             alignment: Alignment.center,
      //             child: Text(
      //               student["status"],
      //               style: const TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w700,
      //                 letterSpacing: 1.2,
      //               ),
      //             ),
      //           ),
      //         ),

      //         const SizedBox(height: 8),

      //         Container(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 10,
      //             vertical: 5,
      //           ),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //             color: isDark
      //                 ? Colors.white.withOpacity(.05)
      //                 : Colors.black.withOpacity(.05),
      //           ),
      //           child: Text(student["days"]),
      //         ),

      //         const SizedBox(height: 8),

      //         Container(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 12,
      //             vertical: 5,
      //           ),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //             border: Border.all(color: const Color(0xFFFF6B4A)),
      //           ),
      //           child: Text(
      //             student["batch"],
      //             style: const TextStyle(
      //               color: Color(0xFFFF6B4A),
      //               fontWeight: FontWeight.w600,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  student["name"].toString().toUpperCase(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              _activeBadge(student["status"]),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xFFFF6B4A),
                child: Text(
                  student["name"][0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B4A).withOpacity(.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.call,
                            size: 14,
                            color: Color(0xFFFF6B4A),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(student["phone"], style: TextStyle(fontSize: 12)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isDark
                            ? Colors.white.withOpacity(.05)
                            : Colors.black.withOpacity(.05),
                      ),
                      child: Text(
                        "# ${student["id"]}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isDark
                          ? Colors.white.withOpacity(.05)
                          : Colors.black.withOpacity(.05),
                    ),
                    child: Text(
                      student["days"],
                      style: TextStyle(fontSize: 10),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFF6B4A)),
                    ),
                    child: Text(
                      student["batch"],
                      style: const TextStyle(
                        color: Color(0xFFFF6B4A),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(12, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(12, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
