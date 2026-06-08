import 'package:acade360admin/Theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ── AppTheme (import from your project instead) ────────────────────────────

// ── Demo entry (remove in real project) ────────────────────────────────────
void main() => runApp(const _DemoApp());

class _DemoApp extends StatefulWidget {
  const _DemoApp();
  @override
  State<_DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<_DemoApp> {
  bool _dark = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
      home: Stack(
        children: [
          const AddTransactionScreen(),
          Positioned(
            top: 48,
            right: 16,
            child: FloatingActionButton.small(
              onPressed: () => setState(() => _dark = !_dark),
              backgroundColor: AppTheme.accentRed,
              child: Icon(
                _dark ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── AddTransactionScreen ────────────────────────────────────────────────────
class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  // ── state ──────────────────────────────────
  bool _isIncome = true;
  DateTime _selectedDate = DateTime(2026, 6, 5);
  String _amount = '0';
  String? _selectedMethod;
  final TextEditingController _customMethodCtrl = TextEditingController();
  final TextEditingController _referenceCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  // ── helpers ────────────────────────────────
  bool get _dark => AppTheme.isDark(context);
  Color get _card => AppTheme.cardBackground(context);
  Color get _border => AppTheme.border(context);
  Color get _text => AppTheme.textPrimary(context);
  Color get _sub => AppTheme.textSecondary(context);

  String get _formattedDate {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${_selectedDate.day} ${months[_selectedDate.month - 1]} ${_selectedDate.year}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: Theme.of(
            ctx,
          ).colorScheme.copyWith(primary: AppTheme.accentRed),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _onAmountKey(String key) {
    setState(() {
      if (key == '⌫') {
        if (_amount.length > 1) {
          _amount = _amount.substring(0, _amount.length - 1);
        } else {
          _amount = '0';
        }
      } else if (key == '.') {
        if (!_amount.contains('.')) _amount += '.';
      } else {
        if (_amount == '0') {
          _amount = key;
        } else {
          _amount += key;
        }
      }
    });
  }

  @override
  void dispose() {
    _customMethodCtrl.dispose();
    _referenceCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark
          ? AppTheme.backgroundDark
          : AppTheme.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ──────────────────────────────
            _TopBar(
              onCancel: () => Navigator.maybePop(context),
              onSave: () {
                // Handle save
              },
            ),

            // ── Scrollable body ──────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section: Transaction
                    _SectionLabel(label: 'Transaction', sub: _sub),
                    const SizedBox(height: 10),

                    // Card: toggle + amount + date
                    Container(
                      decoration: BoxDecoration(
                        color: _card,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _border),
                      ),
                      child: Column(
                        children: [
                          // Income / Expense toggle
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: _IncomeExpenseToggle(
                              isIncome: _isIncome,
                              onChanged: (v) => setState(() => _isIncome = v),
                              dark: _dark,
                            ),
                          ),

                          // Divider
                          Divider(height: 1, color: _border),

                          // Amount
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _amount,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: _text,
                                ),
                              ),
                            ),
                          ),

                          Divider(height: 1, color: _border),

                          // Date row
                          InkWell(
                            onTap: _pickDate,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: _text,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _dark
                                          ? AppTheme.primaryWhite.withOpacity(
                                              0.10,
                                            )
                                          : AppTheme.primaryBlack.withOpacity(
                                              0.07,
                                            ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      _formattedDate,
                                      style: TextStyle(
                                        color: _text,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Section: Payment
                    _SectionLabel(label: 'Payment', sub: _sub),
                    const SizedBox(height: 10),

                    // Card: method + custom method + reference
                    Container(
                      decoration: BoxDecoration(
                        color: _card,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _border),
                      ),
                      child: Column(
                        children: [
                          // Method row
                          InkWell(
                            onTap: () => _showMethodPicker(),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Method',
                                    style: TextStyle(
                                      color: _text,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    _selectedMethod ?? 'Select',
                                    style: const TextStyle(
                                      color: AppTheme.accentRed,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.unfold_more_rounded,
                                    color: AppTheme.accentRed,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Divider(height: 1, color: _border, indent: 16),

                          // Custom method
                          _PlaceholderField(
                            controller: _customMethodCtrl,
                            hint: 'Custom method',
                            sub: _sub,
                            border: _border,
                            showDivider: true,
                          ),

                          // Reference
                          _PlaceholderField(
                            controller: _referenceCtrl,
                            hint: 'Identification / reference',
                            sub: _sub,
                            border: _border,
                            showDivider: false,
                            roundBottom: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Section: Description
                    _SectionLabel(label: 'Description', sub: _sub),
                    const SizedBox(height: 10),

                    // Description text area
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: _card,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _border),
                      ),
                      child: TextField(
                        controller: _descriptionCtrl,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(color: _text, fontSize: 14),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(14),
                          hintText: '',
                          hintStyle: TextStyle(color: _sub),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMethodPicker() {
    final methods = ['Cash', 'Card', 'UPI', 'Bank Transfer', 'Cheque', 'Other'];
    showModalBottomSheet(
      context: context,
      backgroundColor: _dark ? AppTheme.surfaceDark : AppTheme.primaryWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: _sub,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          ...methods.map(
            (m) => ListTile(
              title: Text(
                m,
                style: TextStyle(color: _text, fontWeight: FontWeight.w500),
              ),
              trailing: _selectedMethod == m
                  ? const Icon(Icons.check_rounded, color: AppTheme.accentRed)
                  : null,
              onTap: () {
                setState(() => _selectedMethod = m);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ── Top bar ─────────────────────────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  const _TopBar({required this.onCancel, required this.onSave});
  final VoidCallback onCancel, onSave;

  @override
  Widget build(BuildContext context) {
    final dark = AppTheme.isDark(context);
    final sub = AppTheme.textSecondary(context);
    final text = AppTheme.textPrimary(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Cancel
          GestureDetector(
            onTap: onCancel,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: dark
                      ? AppTheme.primaryWhite.withOpacity(0.15)
                      : AppTheme.primaryBlack.withOpacity(0.12),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppTheme.accentRed,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Add Transaction',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: text,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // Save
          GestureDetector(
            onTap: onSave,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: dark
                      ? AppTheme.primaryWhite.withOpacity(0.15)
                      : AppTheme.primaryBlack.withOpacity(0.12),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  color: sub,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Income / Expense segmented toggle ───────────────────────────────────────
class _IncomeExpenseToggle extends StatelessWidget {
  const _IncomeExpenseToggle({
    required this.isIncome,
    required this.onChanged,
    required this.dark,
  });
  final bool isIncome, dark;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final bg = dark
        ? AppTheme.primaryWhite.withOpacity(0.10)
        : AppTheme.primaryBlack.withOpacity(0.07);

    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _Segment(
            label: 'Income',
            active: isIncome,
            onTap: () => onChanged(true),
            dark: dark,
          ),
          _Segment(
            label: 'Expense',
            active: !isIncome,
            onTap: () => onChanged(false),
            dark: dark,
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.active,
    required this.onTap,
    required this.dark,
  });
  final String label;
  final bool active, dark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: active
                ? (dark
                      ? AppTheme.primaryWhite.withOpacity(0.15)
                      : AppTheme.primaryWhite)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: active && !dark
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: active
                  ? AppTheme.textPrimary(context)
                  : AppTheme.textSecondary(context),
              fontSize: 14,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Section label ────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label, required this.sub});
  final String label;
  final Color sub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        label,
        style: TextStyle(
          color: sub,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

// ── Placeholder text field row ───────────────────────────────────────────────
class _PlaceholderField extends StatelessWidget {
  const _PlaceholderField({
    required this.controller,
    required this.hint,
    required this.sub,
    required this.border,
    this.showDivider = false,
    this.roundBottom = false,
  });
  final TextEditingController controller;
  final String hint;
  final Color sub, border;
  final bool showDivider, roundBottom;

  @override
  Widget build(BuildContext context) {
    final text = AppTheme.textPrimary(context);
    return Column(
      children: [
        TextField(
          controller: controller,
          style: TextStyle(color: text, fontSize: 14),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            hintText: hint,
            hintStyle: TextStyle(color: sub, fontSize: 14),
          ),
        ),
        if (showDivider) Divider(height: 1, color: border, indent: 16),
      ],
    );
  }
}
