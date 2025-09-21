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
// Updated priority colors with better contrast
const Color kHighPriorityColor = Color(0xFFFEF2F2); // Light red
const Color kMediumPriorityColor = Color(0xFFFFFBEB); // Light amber
const Color kLowPriorityColor = Color(0xFFF0FDF4); // Light green

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
}

class SkillGapScreen extends StatelessWidget {
  const SkillGapScreen({super.key});

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
                _buildSkillScoreCard(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildLearningPathSection(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildQuickActionsSection(context),
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
                  "Skill Gap Analysis",
                  style: TextStyle(
                    fontSize: Responsive.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Your path to becoming a Frontend Developer",
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
                Icons.analytics_rounded,
                color: kPrimaryColor,
                size: 28,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSkillScoreCard(BuildContext context) {
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
                  Icons.trending_up_rounded,
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
                      "Your Skill Score",
                      style: TextStyle(
                        fontSize: Responsive.getResponsiveFontSize(context, 18),
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Great progress! Keep learning",
                      style: TextStyle(
                        fontSize: 14,
                        color: kSecondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "76%",
                style: TextStyle(
                  fontSize: Responsive.getResponsiveFontSize(context, 32),
                  fontWeight: FontWeight.bold,
                  color: kSuccessColor,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.76,
              minHeight: 12,
              backgroundColor: kLightGreyColor,
              valueColor: AlwaysStoppedAnimation<Color>(kSuccessColor),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildScoreMetric("Skills Mastered", "12/18", kSuccessColor),
              _buildScoreMetric("In Progress", "3", kWarningColor),
              _buildScoreMetric("To Learn", "3", kErrorColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreMetric(String label, String value, Color color) {
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

  Widget _buildLearningPathSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended Learning Path",
          style: TextStyle(
            fontSize: Responsive.getResponsiveFontSize(context, 22),
            fontWeight: FontWeight.bold,
            color: kTextColor,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 20),
        _buildLearningPhase(
          context,
          "1",
          "Phase 1: Critical Skills",
          "2-3 months",
          [
            _buildSkillCardData(
              "Testing Frameworks",
              "High Priority",
              "1-2 weeks",
              kHighPriorityColor,
              kErrorColor,
              Icons.bug_report_rounded,
            ),
            _buildSkillCardData(
              "AWS Cloud Services",
              "Low Priority",
              "4-6 weeks",
              kLowPriorityColor,
              kSuccessColor,
              Icons.cloud_rounded,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildLearningPhase(
          context,
          "2",
          "Phase 2: Advanced Skills",
          "2-3 months",
          [
            _buildSkillCardData(
              "React Framework",
              "High Priority",
              "3-4 weeks",
              kHighPriorityColor,
              kErrorColor,
              Icons.code_rounded,
            ),
            _buildSkillCardData(
              "Redux State Management",
              "Medium Priority",
              "1-2 weeks",
              kMediumPriorityColor,
              kWarningColor,
              Icons.memory_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLearningPhase(BuildContext context, String phase, String title, String duration, List<Map<String, dynamic>> skills) {
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
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    phase,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: Responsive.getResponsiveFontSize(context, 18),
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: const TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: skills.map((skill) => _buildSkillCard(context, skill)).toList(),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _buildSkillCardData(String title, String priority, String duration, Color priorityColor, Color priorityTextColor, IconData icon) {
    return {
      'title': title,
      'priority': priority,
      'duration': duration,
      'priorityColor': priorityColor,
      'priorityTextColor': priorityTextColor,
      'icon': icon,
    };
  }

  Widget _buildSkillCard(BuildContext context, Map<String, dynamic> skillData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: kLightGreyColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to skill detail screen
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: skillData['priorityColor'] as Color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  skillData['icon'] as IconData,
                  size: 20,
                  color: skillData['priorityTextColor'] as Color,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skillData['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: skillData['priorityColor'] as Color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            skillData['priority'] as String,
                            style: TextStyle(
                              fontSize: 11,
                              color: skillData['priorityTextColor'] as Color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.schedule_rounded,
                          size: 14,
                          color: kSecondaryTextColor,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            skillData['duration'] as String,
                            style: const TextStyle(
                              color: kSecondaryTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: kSecondaryTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
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
              fontSize: Responsive.getResponsiveFontSize(context, 20),
              fontWeight: FontWeight.bold,
              color: kTextColor,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              _buildQuickActionCard("Take Assessment", Icons.quiz_rounded, kPrimaryColor),
              _buildQuickActionCard("Find Courses", Icons.school_rounded, kSuccessColor),
              _buildQuickActionCard("Track Progress", Icons.timeline_rounded, kWarningColor),
              _buildQuickActionCard("Get Mentorship", Icons.people_rounded, kAccentColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard(String title, IconData icon, Color color) {
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
              Icon(icon, size: 28, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: kTextColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
