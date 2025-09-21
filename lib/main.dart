import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CareerAI/screens/home_screen.dart';
import 'package:CareerAI/screens/career_paths_screen.dart';
import 'package:CareerAI/screens/market_trends_screen.dart';
import 'package:CareerAI/screens/roadmap_screen.dart';
import 'package:CareerAI/screens/skill_gap_screen.dart';
import 'package:CareerAI/screens/dashboard_screen.dart';
import 'package:CareerAI/widgets/debug_overlay.dart';
import 'package:CareerAI/widgets/bottom_nav_bar.dart';
// Constants
const Color kPrimaryColor = Color(0xFF4A90E2);
const Color kPrimaryGreen = Color(0xFF34A853);
const Color kBackgroundColor = Color(0xFFF8F9FA);
const Color kLightGreyColor = Color(0xFFF5F5F5);
const Color kTextColor = Color(0xFF333333);
const Color kSecondaryTextColor = Color(0xFF757575);

const bool kShowDebugOverlay = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareerAI',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: kTextColor,
          displayColor: kTextColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: kTextColor),
          titleTextStyle: TextStyle(
            color: kTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(surface: kBackgroundColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const DashboardScreen(),
    const CareerPathsScreen(),
    const SkillGapScreen(),
    const RoadmapScreen(),
    const MarketTrendsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Career'),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.login, color: kTextColor),
            label: const Text('Login', 
              style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          if (kShowDebugOverlay) const DebugOverlay(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
