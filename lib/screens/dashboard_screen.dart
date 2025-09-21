import 'package:flutter/material.dart';

// Modern color scheme with purple theme
const Color kPrimaryColor = Color(0xFF7C4DFF);
const Color kPrimaryGreen = Color(0xFF34A853);
const Color kAccentColor = Color(0xFF03DAC6);
const Color kLightGreyColor = Color(0xFFF8F9FA);
const Color kCardColor = Color(0xFFFFFFFF);
const Color kTextColor = Color(0xFF1A1A1A);
const Color kSecondaryTextColor = Color(0xFF6B7280);
const Color kSuccessColor = Color(0xFF10B981);
const Color kWarningColor = Color(0xFFF59E0B);
const Color kErrorColor = Color(0xFFEF4444);

// Enhanced responsive helper
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }

  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) return baseFontSize * 0.85;
    if (screenWidth < 650) return baseFontSize * 0.9;
    if (screenWidth < 1100) return baseFontSize;
    return baseFontSize * 1.1;
  }
}

// Enhanced data class for dashboard cards
class DashboardCardData {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  
  const DashboardCardData({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconColor,
    required this.backgroundColor,
    this.onTap,
  });
}

// Progress step data class
class ProgressStepData {
  final String title;
  final bool isCompleted;
  final bool isActive;
  
  const ProgressStepData({
    required this.title,
    required this.isCompleted,
    this.isActive = false,
  });
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(Responsive.getResponsivePadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                _buildDashboardCards(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildRoadmapSection(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildRecentActivities(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildQuickActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCards(BuildContext context) {
    final cardData = _getCardData();
    
    return Column(
      children: cardData.map((data) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: DashboardCard(data: data),
      )).toList(),
    );
  }

  Widget _buildRoadmapSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Roadmap Progress",
                      style: TextStyle(
                        fontSize: Responsive.getResponsiveFontSize(context, 22),
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Frontend Developer Path",
                      style: TextStyle(
                        fontSize: Responsive.getResponsiveFontSize(context, 16),
                        color: kSecondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: kSuccessColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "70% Complete",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kSuccessColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.7,
              minHeight: 8,
              backgroundColor: kLightGreyColor,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          ),
          const SizedBox(height: 32),
          _buildProgressSteps(context),
        ],
      ),
    );
  }

  Widget _buildProgressSteps(BuildContext context) {
    final steps = [
      const ProgressStepData(title: 'HTML/CSS Basics', isCompleted: true),
      const ProgressStepData(title: 'JavaScript Fundamentals', isCompleted: true),
      const ProgressStepData(title: 'React Development', isCompleted: true, isActive: true),
      const ProgressStepData(title: 'Advanced Projects', isCompleted: false),
    ];

    if (Responsive.isMobile(context)) {
      return Column(
        children: steps.map((step) => _buildMobileProgressStep(step)).toList(),
      );
    }

    return Row(
      children: steps.map((step) => Expanded(child: _buildProgressStep(step))).toList(),
    );
  }

  Widget _buildProgressStep(ProgressStepData step) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: step.isCompleted 
                ? kSuccessColor.withOpacity(0.1) 
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: step.isActive 
                ? Border.all(color: kPrimaryColor, width: 2)
                : null,
          ),
          child: Icon(
            step.isCompleted 
                ? Icons.check_circle_rounded 
                : Icons.radio_button_unchecked_rounded,
            color: step.isCompleted ? kSuccessColor : Colors.grey.shade400,
            size: 24,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          step.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: step.isCompleted ? kTextColor : kSecondaryTextColor,
            fontWeight: step.isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileProgressStep(ProgressStepData step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: step.isCompleted 
                  ? kSuccessColor.withOpacity(0.1) 
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: step.isActive 
                  ? Border.all(color: kPrimaryColor, width: 2)
                  : null,
            ),
            child: Icon(
              step.isCompleted 
                  ? Icons.check_circle_rounded 
                  : Icons.radio_button_unchecked_rounded,
              color: step.isCompleted ? kSuccessColor : Colors.grey.shade400,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              step.title,
              style: TextStyle(
                color: step.isCompleted ? kTextColor : kSecondaryTextColor,
                fontWeight: step.isActive ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivities(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Activities",
            style: TextStyle(
              fontSize: Responsive.getResponsiveFontSize(context, 22),
              fontWeight: FontWeight.bold,
              color: kTextColor,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 20),
          _buildActivityItem(
            "Completed React Hooks module",
            "2 hours ago",
            Icons.check_circle_rounded,
            kSuccessColor,
          ),
          _buildActivityItem(
            "Started Advanced JavaScript course",
            "1 day ago",
            Icons.play_circle_rounded,
            kPrimaryColor,
          ),
          _buildActivityItem(
            "Updated portfolio project",
            "3 days ago",
            Icons.code_rounded,
            kWarningColor,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: kSecondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: Responsive.getResponsiveFontSize(context, 22),
              fontWeight: FontWeight.bold,
              color: kTextColor,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: [
              _buildActionCard("Take Quiz", Icons.quiz_rounded, kPrimaryColor),
              _buildActionCard("Find Jobs", Icons.work_rounded, kSuccessColor),
              _buildActionCard("Resources", Icons.library_books_rounded, kWarningColor),
              _buildActionCard("Community", Icons.people_rounded, kAccentColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DashboardCardData> _getCardData() {
    return [
      DashboardCardData(
        icon: Icons.check_circle_rounded,
        title: 'Skills Completed',
        value: '12/18',
        subtitle: '3 new skills this week',
        iconColor: kSuccessColor,
        backgroundColor: kSuccessColor.withOpacity(0.1),
        onTap: () {},
      ),
      DashboardCardData(
        icon: Icons.trending_up_rounded,
        title: 'Market Demand',
        value: 'High',
        subtitle: 'For Frontend roles',
        iconColor: kPrimaryColor,
        backgroundColor: kPrimaryColor.withOpacity(0.1),
        onTap: () {},
      ),
      DashboardCardData(
        icon: Icons.flag_rounded,
        title: 'Next Milestone',
        value: 'In 7 Days',
        subtitle: 'Complete React Course',
        iconColor: kWarningColor,
        backgroundColor: kWarningColor.withOpacity(0.1),
        onTap: () {},
      ),
      DashboardCardData(
        icon: Icons.star_rounded,
        title: 'Overall Progress',
        value: '76%',
        subtitle: 'Keep up the great work!',
        iconColor: kAccentColor,
        backgroundColor: kAccentColor.withOpacity(0.1),
        onTap: () {},
      ),
    ];
  }
}

class DashboardCard extends StatelessWidget {
  final DashboardCardData data;

  const DashboardCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: data.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon container
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: data.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  data.icon,
                  color: data.iconColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.value,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: data.iconColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kSecondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: kSecondaryTextColor.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
