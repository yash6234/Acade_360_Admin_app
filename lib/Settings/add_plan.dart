// import 'package:flutter/material.dart';

// class AddPlanSheet extends StatefulWidget {
//   const AddPlanSheet({super.key});

//   @override
//   State<AddPlanSheet> createState() => _AddPlanSheetState();
// }

// class _AddPlanSheetState extends State<AddPlanSheet> {
//   final _nameController = TextEditingController();
//   final _amountController = TextEditingController();
//   final _hoursController = TextEditingController();

//   final List<String> grounds = ['GROUND-A', 'GROUND-B', 'GROUND-C'];
//   final List<String> sessions = [
//     'Morning — GROUND-A',
//     'Afternoon — GROUND-A',
//     'Evening — GROUND-A',
//     'Morning — GROUND-B',
//   ];

//   String? selectedGround = 'GROUND-B';
//   String? selectedSession = 'Morning — GROUND-B';

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _amountController.dispose();
//     _hoursController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Color(0xFF1A1A1A),
//           borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
//         ),
//         child: SafeArea(
//           // top: false,
//           child: Column(
//             // mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               // Spacer(),

//               /// ── HEADER ──────────────────────────────────────
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     // Cancel
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 18,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(.07),
//                           borderRadius: BorderRadius.circular(22),
//                         ),
//                         child: const Text(
//                           'Cancel',
//                           style: TextStyle(
//                             color: Color(0xFFFF6B4A),
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Title
//                     const Expanded(
//                       child: Center(
//                         child: Text(
//                           'Add Plan',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Save
//                     GestureDetector(
//                       onTap: () {
//                         // TODO: handle save
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 18,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(.07),
//                           borderRadius: BorderRadius.circular(22),
//                         ),
//                         child: const Text(
//                           'Save',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 28),

//               /// ── BASIC INFO LABEL ────────────────────────────
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'Basic Info',
//                   style: TextStyle(
//                     color: Color(0xFFFF6B4A),
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 12),

//               /// ── FORM CARD ───────────────────────────────────
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 14),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF252525),
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   child: Column(
//                     children: [
//                       // Name field
//                       _buildTextField(
//                         label: 'Name',
//                         hint: 'Name',
//                         controller: _nameController,
//                         showDivider: true,
//                       ),

//                       // Amount field
//                       _buildTextField(
//                         label: 'Amount',
//                         hint: 'Amount',
//                         controller: _amountController,
//                         keyboardType: TextInputType.number,
//                         showDivider: true,
//                       ),

//                       // Hours field
//                       _buildTextField(
//                         label: 'Hours (optional)',
//                         hint: 'Hours (optional)',
//                         controller: _hoursController,
//                         keyboardType: TextInputType.number,
//                         showDivider: true,
//                       ),

//                       // Ground picker row
//                       _buildPickerRow(
//                         label: 'Ground',
//                         value: selectedGround ?? '',
//                         showDivider: true,
//                         onTap: () => _showGroundPicker(),
//                       ),

//                       // Session picker row
//                       _buildPickerRow(
//                         label: 'Session',
//                         value: selectedSession ?? '',
//                         showDivider: false,
//                         onTap: () => _showSessionPicker(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Text input field with label above hint
//   Widget _buildTextField({
//     required String label,
//     required String hint,
//     required TextEditingController controller,
//     bool showDivider = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   color: Colors.grey.shade400,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               TextField(
//                 controller: controller,
//                 keyboardType: keyboardType,
//                 style: const TextStyle(color: Colors.white, fontSize: 15),
//                 decoration: InputDecoration(
//                   hintText: hint,
//                   hintStyle: TextStyle(
//                     color: Colors.grey.shade600,
//                     fontSize: 15,
//                   ),
//                   isDense: true,
//                   contentPadding: const EdgeInsets.only(bottom: 10),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (showDivider)
//           Divider(
//             height: 1,
//             color: Colors.white.withOpacity(.07),
//             indent: 18,
//             endIndent: 18,
//           ),
//       ],
//     );
//   }

//   /// Picker row (Ground / Session)
//   Widget _buildPickerRow({
//     required String label,
//     required String value,
//     required VoidCallback onTap,
//     bool showDivider = false,
//   }) {
//     return Column(
//       children: [
//         if (showDivider)
//           Divider(
//             height: 1,
//             color: Colors.white.withOpacity(.07),
//             indent: 18,
//             endIndent: 18,
//           ),
//         InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(18),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
//             child: Row(
//               children: [
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     color: Color(0xFFFF6B4A),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 const Icon(
//                   Icons.unfold_more_rounded,
//                   color: Color(0xFFFF6B4A),
//                   size: 18,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   /// Ground picker modal
//   void _showGroundPicker() {
//     _showOptionSheet(
//       title: 'Select Ground',
//       options: grounds,
//       selected: selectedGround,
//       onSelect: (val) => setState(() => selectedGround = val),
//     );
//   }

//   /// Session picker modal
//   void _showSessionPicker() {
//     _showOptionSheet(
//       title: 'Select Session',
//       options: sessions,
//       selected: selectedSession,
//       onSelect: (val) => setState(() => selectedSession = val),
//     );
//   }

//   /// Generic option picker bottom sheet
//   void _showOptionSheet({
//     required String title,
//     required List<String> options,
//     required String? selected,
//     required ValueChanged<String> onSelect,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: const Color(0xFF1A1A1A),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) => SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 12),
//             Container(
//               width: 36,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.white24,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const SizedBox(height: 12),
//             ...options.map(
//               (opt) => ListTile(
//                 title: Text(
//                   opt,
//                   style: TextStyle(
//                     color: opt == selected
//                         ? const Color(0xFFFF6B4A)
//                         : Colors.white,
//                     fontWeight: opt == selected
//                         ? FontWeight.w600
//                         : FontWeight.normal,
//                   ),
//                 ),
//                 trailing: opt == selected
//                     ? const Icon(Icons.check, color: Color(0xFFFF6B4A))
//                     : null,
//                 onTap: () {
//                   onSelect(opt);
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AddPlanSheet extends StatefulWidget {
  const AddPlanSheet({super.key});

  @override
  State<AddPlanSheet> createState() => _AddPlanSheetState();
}

class _AddPlanSheetState extends State<AddPlanSheet> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _hoursController = TextEditingController();

  final List<String> grounds = ['GROUND-A', 'GROUND-B', 'GROUND-C'];
  final List<String> sessions = [
    'Morning — GROUND-A',
    'Afternoon — GROUND-A',
    'Evening — GROUND-A',
    'Morning — GROUND-B',
  ];

  String? selectedGround = 'GROUND-B';
  String? selectedSession = 'Morning — GROUND-B';

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _hoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.9,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              /// ── HEADER ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Cancel
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.07),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFFFF6B4A),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // Title
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Add Plan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    // Save
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.07),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// ── BASIC INFO LABEL ────────────────────────────
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Basic Info',
                  style: TextStyle(
                    color: Color(0xFFFF6B4A),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// ── FORM CARD ───────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF252525),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      _buildTextField(
                        label: 'Name',
                        hint: 'Name',
                        controller: _nameController,
                        showDivider: true,
                      ),
                      _buildTextField(
                        label: 'Amount',
                        hint: 'Amount',
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        showDivider: true,
                      ),
                      _buildTextField(
                        label: 'Hours (optional)',
                        hint: 'Hours (optional)',
                        controller: _hoursController,
                        keyboardType: TextInputType.number,
                        showDivider: true,
                      ),
                      _buildPickerRow(
                        label: 'Ground',
                        value: selectedGround ?? '',
                        showDivider: true,
                        onTap: _showGroundPicker,
                      ),
                      _buildPickerRow(
                        label: 'Session',
                        value: selectedSession ?? '',
                        showDivider: false,
                        onTap: _showSessionPicker,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool showDivider = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: controller,
                keyboardType: keyboardType,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            color: Colors.white.withOpacity(.07),
            indent: 18,
            endIndent: 18,
          ),
      ],
    );
  }

  Widget _buildPickerRow({
    required String label,
    required String value,
    required VoidCallback onTap,
    bool showDivider = false,
  }) {
    return Column(
      children: [
        if (showDivider)
          Divider(
            height: 1,
            color: Colors.white.withOpacity(.07),
            indent: 18,
            endIndent: 18,
          ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFFFF6B4A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.unfold_more_rounded,
                  color: Color(0xFFFF6B4A),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showGroundPicker() {
    _showOptionSheet(
      title: 'Select Ground',
      options: grounds,
      selected: selectedGround,
      onSelect: (val) => setState(() => selectedGround = val),
    );
  }

  void _showSessionPicker() {
    _showOptionSheet(
      title: 'Select Session',
      options: sessions,
      selected: selectedSession,
      onSelect: (val) => setState(() => selectedSession = val),
    );
  }

  void _showOptionSheet({
    required String title,
    required List<String> options,
    required String? selected,
    required ValueChanged<String> onSelect,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            ...options.map(
              (opt) => ListTile(
                title: Text(
                  opt,
                  style: TextStyle(
                    color: opt == selected
                        ? const Color(0xFFFF6B4A)
                        : Colors.white,
                    fontWeight: opt == selected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                trailing: opt == selected
                    ? const Icon(Icons.check, color: Color(0xFFFF6B4A))
                    : null,
                onTap: () {
                  onSelect(opt);
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
