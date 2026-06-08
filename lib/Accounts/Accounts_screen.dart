// import 'package:flutter/material.dart';

// class AccountsScreen extends StatefulWidget {
//   const AccountsScreen({super.key});

//   @override
//   State<AccountsScreen> createState() => _AccountsScreenState();
// }

// class _AccountsScreenState extends State<AccountsScreen> {
//   bool get isDark => Theme.of(context).brightness == Brightness.dark;

//   Color get cardColor => isDark ? const Color(0xFF18181B) : Colors.white;

//   Color get borderColor =>
//       isDark ? Colors.white.withOpacity(.06) : Colors.black.withOpacity(.06);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(14),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _header(),

//               const SizedBox(height: 20),

//               _balanceCard(),

//               const SizedBox(height: 24),

//               _searchSection(),

//               const SizedBox(height: 24),

//               Text(
//                 "All Transactions",
//                 style: Theme.of(
//                   context,
//                 ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
//               ),

//               const SizedBox(height: 4),

//               Text(
//                 "1 records · Page 1 of 1",
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),

//               const SizedBox(height: 20),

//               _transactionCard(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _header() {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Accounts",
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),

//               const SizedBox(height: 4),

//               Text(
//                 "Ledger and transaction controls",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//           decoration: BoxDecoration(
//             color: const Color(0xFFFF6B4A),
//             borderRadius: BorderRadius.circular(18),
//           ),
//           child: const Row(
//             children: [
//               Icon(Icons.add_circle, color: Colors.white, size: 18),
//               SizedBox(width: 8),
//               Text(
//                 "Add",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _balanceCard() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(32),
//         border: Border.all(color: borderColor),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Net Balance", style: Theme.of(context).textTheme.titleMedium),

//           const SizedBox(height: 8),

//           const Text(
//             "₹400.00",
//             style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
//           ),

//           const SizedBox(height: 12),

//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.05),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: const Text(
//               "1 records",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),

//           const SizedBox(height: 20),

//           Row(
//             children: [
//               Container(
//                 width: 16,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),

//               const SizedBox(width: 12),

//               Container(
//                 width: 16,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),

//           Row(
//             children: [
//               Expanded(
//                 child: _amountCard(
//                   "Income",
//                   "₹400.00",
//                   Icons.south_west,
//                   Colors.green,
//                 ),
//               ),

//               const SizedBox(width: 12),

//               Expanded(
//                 child: _amountCard(
//                   "Expense",
//                   "₹0.00",
//                   Icons.north_east,
//                   Colors.red,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 14),

//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.04),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.receipt_long),
//                 SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Visible Records",
//                       style: TextStyle(fontWeight: FontWeight.w700),
//                     ),
//                     Text("1 transactions"),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _amountCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.04),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [Text(title), const SizedBox(height: 4), Text(value)],
//             ),
//           ),

//           CircleAvatar(
//             backgroundColor: color.withOpacity(.15),
//             child: Icon(icon, color: color),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _searchSection() {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 54,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             decoration: BoxDecoration(
//               color: cardColor,
//               borderRadius: BorderRadius.circular(18),
//               border: Border.all(color: const Color(0xFFFF6B4A)),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.search, color: Color(0xFFFF6B4A)),
//                 SizedBox(width: 12),
//                 Expanded(child: Text("Search description, amount...")),
//               ],
//             ),
//           ),
//         ),

//         const SizedBox(width: 12),

//         Container(
//           width: 70,
//           height: 54,
//           decoration: BoxDecoration(
//             color: cardColor,
//             borderRadius: BorderRadius.circular(18),
//             border: Border.all(color: const Color(0xFFFF6B4A)),
//           ),
//           child: const Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.filter_list, color: Color(0xFFFF6B4A)),
//               Text("Filter"),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _transactionCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: borderColor),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 22,
//             backgroundColor: Colors.green.withOpacity(.15),
//             child: const Icon(Icons.south_west, color: Colors.green),
//           ),

//           const SizedBox(width: 12),

//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "20250044",
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
//                 ),
//                 SizedBox(height: 4),
//                 Text("Four Hundred Only"),
//               ],
//             ),
//           ),

//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const Text(
//                 "₹400.00",
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),

//               const SizedBox(height: 6),

//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 5,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.green.withOpacity(.15),
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 child: const Text(
//                   "Income",
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:acade360admin/Accounts/Add_transaction.dart';
import 'package:acade360admin/Theme/app_theme.dart';

import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: Stack(
          children: [
            const AccountsScreen(),
            // Theme-toggle FAB (demo only)
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
      ),
    );
  }
}

// ──────────────────────────────────────────────
// AccountsScreen
// ──────────────────────────────────────────────
class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});
  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  bool get _dark => AppTheme.isDark(context);
  Color get _card => AppTheme.cardBackground(context);
  Color get _border => AppTheme.border(context);
  Color get _text => AppTheme.textPrimary(context);
  Color get _sub => AppTheme.textSecondary(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark
          ? AppTheme.backgroundDark
          : AppTheme.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(text: _text, sub: _sub),
                    const SizedBox(height: 20),
                    _BalanceCard(
                      card: _card,
                      border: _border,
                      text: _text,
                      sub: _sub,
                      dark: _dark,
                    ),
                    const SizedBox(height: 24),
                    _SearchRow(card: _card, sub: _sub),
                    const SizedBox(height: 24),
                    Text(
                      'All Transactions',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '1 records · Page 1 of 1',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    _TransactionCard(
                      card: _card,
                      border: _border,
                      text: _text,
                      sub: _sub,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            // _BottomNav(dark: _dark, border: _border, sub: _sub),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Header
// ──────────────────────────────────────────────
class _Header extends StatelessWidget {
  const _Header({required this.text, required this.sub});
  final Color text, sub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Accounts',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Ledger and transaction controls',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        // Add button
        // Add button
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: AppTheme.accentRed,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.add_circle_rounded, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────
// Balance card
// ──────────────────────────────────────────────
class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.card,
    required this.border,
    required this.text,
    required this.sub,
    required this.dark,
  });

  final Color card, border, text, sub;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row
          Row(
            children: [
              Expanded(
                child: Text(
                  'Net Balance',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: dark
                      ? AppTheme.primaryWhite.withOpacity(0.08)
                      : AppTheme.primaryBlack.withOpacity(0.06),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.show_chart_rounded, color: sub, size: 20),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // amount
          Text(
            '₹400.00',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w800,
              color: text,
            ),
          ),

          const SizedBox(height: 10),

          // badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.softFill(context, alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '1 records',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: sub,
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(height: 18),

          // bar chart
          _BarChart(sub: sub),

          const SizedBox(height: 18),

          // Income / Expense
          Row(
            children: [
              Expanded(
                child: _AmountTile(
                  label: 'Income',
                  amount: '₹400.00',
                  icon: Icons.south_west_rounded,
                  color: AppTheme.successGreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _AmountTile(
                  label: 'Expense',
                  amount: '₹0.00',
                  icon: Icons.north_east_rounded,
                  color: AppTheme.accentRed,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // visible records
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: AppTheme.softFill(context, alpha: 0.06),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.receipt_long_rounded, color: sub, size: 22),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visible Records',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: text,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '1 transactions',
                      style: TextStyle(color: sub, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Bar chart  IN / OUT
// ──────────────────────────────────────────────
class _BarChart extends StatelessWidget {
  const _BarChart({required this.sub});
  final Color sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bars row
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 18,
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.successGreen,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 28,
              height: 14,
              decoration: BoxDecoration(
                color: AppTheme.accentRed,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Labels row — each SizedBox width matches its bar above
        Row(
          children: [
            SizedBox(
              width: 18,
              child: Text(
                'IN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: sub,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 28,
              child: Text(
                'OUT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: sub,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Visible ledger cashflow',
              style: TextStyle(
                color: sub,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────
// Income / Expense tile
// ──────────────────────────────────────────────
class _AmountTile extends StatelessWidget {
  const _AmountTile({
    required this.label,
    required this.amount,
    required this.icon,
    required this.color,
  });

  final String label, amount;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textColor = AppTheme.textPrimary(context);
    final subColor = AppTheme.textSecondary(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.softFill(context, alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: subColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  amount,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 18),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Search + Filter row
// ──────────────────────────────────────────────
class _SearchRow extends StatelessWidget {
  const _SearchRow({required this.card, required this.sub});
  final Color card, sub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppTheme.accentRed.withOpacity(0.60)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  color: AppTheme.accentRed,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  'Search description, am...',
                  style: TextStyle(color: sub, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 70,
          height: 54,
          decoration: BoxDecoration(
            color: AppTheme.accentRed,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.filter_list_rounded, color: Colors.white, size: 20),
              SizedBox(height: 2),
              Text(
                'Filter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────
// Transaction card
// ──────────────────────────────────────────────
class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    required this.card,
    required this.border,
    required this.text,
    required this.sub,
  });
  final Color card, border, text, sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppTheme.successGreen.withOpacity(0.15),
            child: const Icon(
              Icons.south_west_rounded,
              color: AppTheme.successGreen,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '20250044',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: text,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Four Hundred Only',
                  style: TextStyle(color: sub, fontSize: 13),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '₹400.00',
                style: TextStyle(
                  color: AppTheme.successGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.successGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Income',
                  style: TextStyle(
                    color: AppTheme.successGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
