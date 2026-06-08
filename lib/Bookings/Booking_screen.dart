import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<Map<String, dynamic>> grounds = [
    {
      "name": "GROUND-A",
      "subtitle": "GROUND-A",
      "image": "https://images.unsplash.com/photo-1522778119026-d647f0596c20",
    },
    {
      "name": "GROUND-B",
      "subtitle": "GROUND-B",
      "image": "https://images.unsplash.com/photo-1508098682722-e99c643e7485",
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
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          color: Color(0xFFFF6B4A),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 34),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              _headerCard(),

              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: grounds.length,
                  itemBuilder: (_, index) {
                    return _groundCard(grounds[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFF6B4A).withOpacity(.12),
            ),
            child: const Icon(
              Icons.directions_run_rounded,
              color: Color(0xFFFF6B4A),
              size: 30,
            ),
          ),

          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ground Bookings",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 4),

              Text("2 venues", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }

  Widget _groundCard(Map<String, dynamic> ground) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              height: 220,
              width: double.infinity,
              child: Image.network(ground["image"], fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ground["name"],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(ground["subtitle"]),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFFF6B4A).withOpacity(.12),
                ),
                child: const Text(
                  "Show Booking",
                  style: TextStyle(
                    color: Color(0xFFFF6B4A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _timeChip("06:00 - 12:00")),

              const SizedBox(width: 10),

              Expanded(child: _timeChip("12:00 - 17:00")),

              const SizedBox(width: 10),

              Expanded(child: _timeChip("17:00 - 22:00")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark
            ? Colors.white.withOpacity(.04)
            : Colors.black.withOpacity(.04),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      ),
    );
  }
}
