import 'package:flutter/material.dart';

// Updated modern color scheme
const Color kPrimaryColor = Color(0xFF7C4DFF); // Modern purple
const Color kPrimaryGreen = Color(0xFF34A853); // Google Green
const Color kAccentColor = Color(0xFF03DAC6); // Modern teal
const Color kLightGreyColor = Color(0xFFF8F9FA);
const Color kCardColor = Color(0xFFFFFFFF);
const Color kTextColor = Color(0xFF1A1A1A);
const Color kSecondaryTextColor = Color(0xFF6B7280);
const Color kSuccessColor = Color(0xFF10B981);
const Color kWarningColor = Color(0xFFF59E0B);
const Color kErrorColor = Color(0xFFEF4444);
const Color kInProgressColor = Color(0xFF3B82F6);

// Enhanced responsive helper
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  // Enhanced static methods with more breakpoints
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return 12.0; // Very small phones
    if (width < 600) return 16.0; // Mobile
    if (width < 900) return 20.0; // Small tablets
    if (width < 1200) return 24.0; // Large tablets
    return 32.0; // Desktop
  }

  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) return baseFontSize * 0.85;
    if (screenWidth < 600) return baseFontSize * 0.9;
    if (screenWidth < 900) return baseFontSize * 0.95;
    if (screenWidth < 1200) return baseFontSize;
    return baseFontSize * 1.1;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 650 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

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
                _buildHeader(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildActionButtons(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildOverviewCard(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildRoadmapSections(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildNextStepsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor.withOpacity(0.1),
            kAccentColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kPrimaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Roadmap",
                  style: TextStyle(
                    fontSize: Responsive.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Your learning path to becoming a Frontend Developer",
                  style: TextStyle(
                    fontSize: Responsive.getResponsiveFontSize(context, 16),
                    color: kSecondaryTextColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (!Responsive.isMobile(context))
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.route_rounded,
                color: kPrimaryColor,
                size: 28,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Responsive(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPrimaryButton(context),
          const SizedBox(height: 12),
          _buildSecondaryButton(context),
        ],
      ),
      desktop: Row(
        children: [
          Expanded(child: _buildPrimaryButton(context)),
          const SizedBox(width: 16),
          Expanded(child: _buildSecondaryButton(context)),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.map_rounded, size: 20),
          const SizedBox(width: 8),
          Text(
            "View Full Roadmap",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Responsive.getResponsiveFontSize(context, 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: kPrimaryColor.withOpacity(0.3)),
        foregroundColor: kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.tune_rounded, size: 20),
          const SizedBox(width: 8),
          Text(
            "Customize Plan",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Responsive.getResponsiveFontSize(context, 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kSuccessColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.timeline_rounded,
                  color: kSuccessColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overall Progress",
                      style: TextStyle(
                        fontSize: Responsive.getResponsiveFontSize(context, 18),
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "You're doing great! Keep it up",
                      style: const TextStyle(
                        fontSize: 14,
                        color: kSecondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "55%",
                style: TextStyle(
                  fontSize: Responsive.getResponsiveFontSize(context, 24),
                  fontWeight: FontWeight.bold,
                  color: kSuccessColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 8,
              backgroundColor: kLightGreyColor,
              valueColor: AlwaysStoppedAnimation<Color>(kSuccessColor),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressMetric("Completed", "7", kSuccessColor),
              _buildProgressMetric("In Progress", "2", kInProgressColor),
              _buildProgressMetric("Remaining", "4", kSecondaryTextColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: kSecondaryTextColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRoadmapSections(BuildContext context) {
    return Column(
      children: [
        _buildRoadmapSection(
          context,
          "Foundation Building",
          "In Progress",
          0.85,
          kInProgressColor,
          [
            _buildRoadmapItemData("HTML & CSS Mastery", true, Icons.web_rounded),
            _buildRoadmapItemData("JavaScript Fundamentals", true, Icons.javascript_rounded),
            _buildRoadmapItemData("Version Control with Git", true, Icons.source_rounded),
            _buildRoadmapItemData("API Integration (Fetch/Axios)", false, Icons.api_rounded),
          ],
        ),
        const SizedBox(height: 24),
        _buildRoadmapSection(
          context,
          "React Development",
          "Upcoming",
          0.25,
          kWarningColor,
          [
            _buildRoadmapItemData("Component Basics & JSX", true, Icons.widgets_rounded),
            _buildRoadmapItemData("State Management (Hooks)", false, Icons.memory_rounded),
            _buildRoadmapItemData("Advanced React Patterns", false, Icons.architecture_rounded),
          ],
        ),
      ],
    );
  }

  Map<String, dynamic> _buildRoadmapItemData(String title, bool isCompleted, IconData icon) {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'icon': icon,
    };
  }

  Widget _buildRoadmapSection(BuildContext context, String title, String status, double progress, Color statusColor, List<Map<String, dynamic>> items) {
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
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: Responsive.getResponsiveFontSize(context, 18),
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: kLightGreyColor,
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${(progress * 100).toInt()}% Complete",
            style: TextStyle(
              fontSize: 12,
              color: kSecondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: items.map((item) => _buildRoadmapItem(context, item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRoadmapItem(BuildContext context, Map<String, dynamic> itemData) {
    final isCompleted = itemData['isCompleted'] as bool;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCompleted ? kSuccessColor.withOpacity(0.05) : kLightGreyColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCompleted ? kSuccessColor.withOpacity(0.2) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCompleted ? kSuccessColor.withOpacity(0.1) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              itemData['icon'] as IconData,
              size: 16,
              color: isCompleted ? kSuccessColor : Colors.grey.shade600,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              itemData['title'] as String,
              style: TextStyle(
                color: isCompleted ? kTextColor : kSecondaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          Icon(
            isCompleted ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
            color: isCompleted ? kSuccessColor : Colors.grey.shade400,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended Next Steps",
          style: TextStyle(
            fontSize: Responsive.getResponsiveFontSize(context, 22),
            fontWeight: FontWeight.bold,
            color: kTextColor,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 20),
        Responsive(
          mobile: const NextSteps(isMobile: true),
          desktop: const NextSteps(),
        ),
      ],
    );
  }
}

class NextSteps extends StatelessWidget {
  final bool isMobile;
  const NextSteps({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: [
          _buildLearningContent(context),
          const SizedBox(height: 16),
          _buildMilestoneContent(context),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildLearningContent(context)),
        const SizedBox(width: 20),
        Expanded(child: _buildMilestoneContent(context)),
      ],
    );
  }

  Widget _buildLearningContent(BuildContext context) {
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kInProgressColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.school_rounded,
                  color: kInProgressColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Continue Learning",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildStep("React Basics course (2 weeks remaining)"),
          _buildStep("Build a to-do app project"),
          _buildStep("Learn hooks and state management"),
        ],
      ),
    );
  }

  Widget _buildMilestoneContent(BuildContext context) {
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kWarningColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.flag_rounded,
                  color: kWarningColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Upcoming Milestones",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildStep("Finish Phase 1 (2 weeks)"),
          _buildStep("Start TypeScript learning"),
          _buildStep("Join React developer community"),
        ],
      ),
    );
  }

  Widget _buildStep(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 8, right: 12),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: kSecondaryTextColor,
                height: 1.5,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
