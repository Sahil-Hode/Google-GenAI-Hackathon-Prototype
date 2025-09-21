import 'package:flutter/material.dart';

// --- Missing constants from 'constants.dart' are now defined here ---
const Color kLightGreyColor = Color(0xFFF5F5F5);
const Color kTextColor = Color(0xFF333333);
const Color kSecondaryTextColor = Color(0xFF757575);

// --- Missing responsive helper from 'responsive.dart' is now defined here ---
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;
}

// --- Main Screen Widget ---
class MarketTrendsScreen extends StatelessWidget {
  const MarketTrendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      body: Center(
        child: Container(
          // Constraining the width for better readability on large screens
          constraints: const BoxConstraints(maxWidth: 500),
          margin: EdgeInsets.all(Responsive.isMobile(context) ? 24.0 : 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make column take minimum height
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.query_stats_rounded, size: 80, color: kSecondaryTextColor),
              const SizedBox(height: 20),
              const Text(
                "Market Trends - Coming Soon!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              ),
              const SizedBox(height: 10),
              const Text(
                "We are working hard to bring you the latest insights on industry trends, salary benchmarks, and in-demand skills.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: kSecondaryTextColor,
                    height: 1.5), // Increased line height for readability
              ),
            ],
          ),
        ),
      ),
    );
  }
}