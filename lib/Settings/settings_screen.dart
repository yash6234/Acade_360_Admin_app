import 'package:acade360admin/Settings/Manage_Coach&staff.dart';
import 'package:acade360admin/Settings/manage_ground.dart';
import 'package:acade360admin/Theme/app_theme.dart';
import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// SettingsScreen
// Usage: Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
// ─────────────────────────────────────────────
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _shareAnalytics = true; // toggle state

  // ── theme helpers ──────────────────────────
  bool get _dark => AppTheme.isDark(context);
  Color get _card => _dark
      ? AppTheme.primaryWhite.withOpacity(0.06)
      : AppTheme.primaryWhite.withOpacity(0.90);
  Color get _border => _dark
      ? AppTheme.primaryWhite.withOpacity(0.07)
      : AppTheme.primaryBlack.withOpacity(0.07);
  Color get _text => AppTheme.textPrimary(context);
  Color get _sub => AppTheme.textSecondary(context);
  Color get _bg => _dark ? AppTheme.backgroundDark : AppTheme.backgroundLight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ──────────────────────
            _TopBar(text: _text),

            // ── Scrollable content ───────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Administration ───────
                    _SectionLabel(label: 'Administration', sub: _sub),
                    const SizedBox(height: 10),
                    _MenuCard(
                      border: _border,
                      card: _card,
                      text: _text,
                      sub: _sub,
                      items: [
                        _MenuItem(
                          icon: Icons.domain_rounded,
                          label: 'Manage Academy',
                        ),
                        _MenuItem(
                          icon: Icons.people_outline_rounded,
                          label: 'Manage Staff & Coaches',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StaffCoachesScreen(),
                              ),
                            );
                          },
                        ),
                        _MenuItem(
                          icon: Icons.inventory_2_outlined,
                          label: 'Manage Inventory',
                        ),
                        _MenuItem(
                          icon: Icons.people_outline_rounded,
                          label: 'Manage Ground',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ManageGroundsScreen(),
                              ),
                            );
                          },
                        ),
                        _MenuItem(
                          icon: Icons.settings_outlined,
                          label: 'App Settings',
                          isLast: true,
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── Privacy ──────────────
                    _SectionLabel(label: 'Privacy', sub: _sub),
                    const SizedBox(height: 10),
                    _MenuCard(
                      border: _border,
                      card: _card,
                      text: _text,
                      sub: _sub,
                      items: [
                        _ToggleMenuItem(
                          icon: Icons.shield_outlined,
                          label: 'Share Anonymous\nAnalytics',
                          value: _shareAnalytics,
                          onChanged: (v) => setState(() => _shareAnalytics = v),
                        ),
                        const _MenuItem(
                          icon: Icons.description_outlined,
                          label: 'Privacy Details',
                          isLast: true,
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── About ────────────────
                    _MenuCard(
                      border: _border,
                      card: _card,
                      text: _text,
                      sub: _sub,
                      items: const [
                        _MenuItem(
                          icon: Icons.info_outline_rounded,
                          label: 'About',
                          isLast: true,
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── Account label (visible at bottom like image) ──
                    _SectionLabel(label: 'Account', sub: _sub),
                    const SizedBox(height: 10),
                    _MenuCard(
                      border: _border,
                      card: _card,
                      text: _text,
                      sub: _sub,
                      items: const [
                        _MenuItem(
                          icon: Icons.person_outline_rounded,
                          label: 'Profile',
                        ),
                        _MenuItem(
                          icon: Icons.logout_rounded,
                          label: 'Sign Out',
                          isLast: true,
                          isDanger: true,
                        ),
                      ],
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
}

// ─────────────────────────────────────────────
// Top bar
// ─────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  const _TopBar({required this.text});
  final Color text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back button left
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.isDark(context)
                      ? AppTheme.primaryWhite.withOpacity(0.08)
                      : AppTheme.primaryBlack.withOpacity(0.06),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.chevron_left_rounded, color: text, size: 26),
              ),
            ),
          ),
          // Title center
          Text(
            'Settings',
            style: TextStyle(
              color: text,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Section label
// ─────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label, required this.sub});
  final String label;
  final Color sub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        label,
        style: TextStyle(
          color: sub,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Menu card — holds a list of items
// ─────────────────────────────────────────────
class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.items,
    required this.border,
    required this.card,
    required this.text,
    required this.sub,
  });

  final List<dynamic> items;
  final Color border, card, text, sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          // Inject theme colors into each child via InheritedWidget pattern
          // (we pass them as constructor args instead)
          final item = items[i];
          if (item is _MenuItem) {
            return _MenuItemTile(
              item: item,
              border: border,
              text: text,
              sub: sub,
            );
          } else if (item is _ToggleMenuItem) {
            return _ToggleMenuItemTile(item: item, border: border, text: text);
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Data classes
// ─────────────────────────────────────────────
class _MenuItem {
  final IconData icon;
  final String label;
  final bool isLast;
  final bool isDanger;
  final VoidCallback? onTap;
  const _MenuItem({
    required this.icon,
    required this.label,
    this.isLast = false,
    this.isDanger = false,
    this.onTap,
  });
}

class _ToggleMenuItem {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleMenuItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });
}

// ─────────────────────────────────────────────
// Regular menu row tile
// ─────────────────────────────────────────────
class _MenuItemTile extends StatelessWidget {
  const _MenuItemTile({
    required this.item,
    required this.border,
    required this.text,
    required this.sub,
  });

  final _MenuItem item;
  final Color border, text, sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: item.onTap,
          borderRadius: item.isLast
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              : BorderRadius.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                // Icon
                Icon(
                  item.icon,
                  color: item.isDanger
                      ? AppTheme.accentRed
                      : AppTheme.accentRed.withOpacity(0.85),
                  size: 22,
                ),
                const SizedBox(width: 14),
                // Label
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: item.isDanger ? AppTheme.accentRed : text,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Chevron
                Icon(
                  Icons.chevron_right_rounded,
                  color: sub.withOpacity(0.6),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (!item.isLast)
          Divider(height: 1, indent: 52, endIndent: 0, color: border),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Toggle menu row tile
// ─────────────────────────────────────────────
class _ToggleMenuItemTile extends StatelessWidget {
  const _ToggleMenuItemTile({
    required this.item,
    required this.border,
    required this.text,
  });

  final _ToggleMenuItem item;
  final Color border, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: AppTheme.accentRed.withOpacity(0.85),
                size: 22,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    color: text,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                  ),
                ),
              ),
              // Custom-styled switch to match the reddish toggle in image
              Transform.scale(
                scale: 0.85,
                child: Switch(
                  value: item.value,
                  onChanged: item.onChanged,
                  activeColor: Colors.white,
                  activeTrackColor: AppTheme.accentRed,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppTheme.primaryWhite.withOpacity(0.20),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, indent: 52, color: border),
      ],
    );
  }
}
