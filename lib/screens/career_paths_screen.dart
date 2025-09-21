import 'package:flutter/material.dart';

// Updated modern color scheme
const Color kPrimaryColor = Color(0xFF7C4DFF); // Modern purple
const Color kPrimaryGreen = Color(0xFF34A853); // Google Green
const Color kAccentColor = Color(0xFF03DAC6); // Modern teal
const Color kLightGreyColor = Color(0xFFF8F9FA);
const Color kCardColor = Color(0xFFFFFFFF);
const Color kTextColor = Color(0xFF1A1A1A);
const Color kSecondaryTextColor = Color(0xFF6B7280);
const Color kHighDemandColor = Color(0xFFE8F5E9); // Light green
const Color kMediumDemandColor = Color(0xFFFFF3E0); // Light orange
const Color kTechHubColor = Color(0xFFE3F2FD); // Light blue
const Color kSuccessColor = Color(0xFF10B981);
const Color kWarningColor = Color(0xFFF59E0B);

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

class CareerPathsScreen extends StatelessWidget {
  const CareerPathsScreen({super.key});

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
                _buildCareerCards(context),
                SizedBox(height: Responsive.isMobile(context) ? 24 : 32),
                _buildExploreSection(context),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Personalized Career Paths",
                  style: TextStyle(
                    fontSize: Responsive.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.rocket_launch_rounded,
                  color: kPrimaryColor,
                  size: Responsive.isMobile(context) ? 24 : 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Based on your skills, interests, and market trends.",
            style: TextStyle(
              fontSize: Responsive.getResponsiveFontSize(context, 16),
              color: kSecondaryTextColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareerCards(BuildContext context) {
    final careerPaths = [
      {
        'title': 'Frontend Developer',
        'match': '92% match',
        'demand': 'High Demand',
        'demandColor': kHighDemandColor,
        'demandTextColor': kSuccessColor,
        'location': 'Pan India',
        'locationColor': kTechHubColor,
        'locationTextColor': kPrimaryColor,
        'description':
            'Create beautiful, responsive user interfaces and interactive web applications using frameworks like React, Vue, or Angular.',
        'salary': '₹8-20 LPA',
        'skills': ['HTML/CSS', 'JavaScript', 'React', 'TypeScript'],
        'growth': '25% annual growth',
        'icon': Icons.code_rounded,
      },
      {
        'title': 'Data Scientist',
        'match': '88% match',
        'demand': 'High Demand',
        'demandColor': kHighDemandColor,
        'demandTextColor': kSuccessColor,
        'location': 'Bangalore, Mumbai',
        'locationColor': kTechHubColor,
        'locationTextColor': kPrimaryColor,
        'description':
            'Extract insights from data using machine learning, statistical analysis, and data visualization to drive business decisions.',
        'salary': '₹12-30 LPA',
        'skills': ['Python', 'Machine Learning', 'SQL', 'Statistics', '+2 more'],
        'growth': '30% annual growth',
        'icon': Icons.analytics_rounded,
      },
      {
        'title': 'Product Manager',
        'match': '85% match',
        'demand': 'Medium Demand',
        'demandColor': kMediumDemandColor,
        'demandTextColor': kWarningColor,
        'location': 'Remote',
        'locationColor': kTechHubColor,
        'locationTextColor': kPrimaryColor,
        'description':
            'Lead product strategy, work cross-functionally with engineering, design, and marketing to launch successful products.',
        'salary': '₹15-40 LPA',
        'skills': ['Product Strategy', 'Analytics', 'Agile', 'Leadership'],
        'growth': '15% annual growth',
        'icon': Icons.business_center_rounded,
      },
      // --- NEW DUMMY DATA ADDED BELOW ---
      {
        'title': 'Full Stack Developer',
        'match': '95% match',
        'demand': 'High Demand',
        'demandColor': kHighDemandColor,
        'demandTextColor': kSuccessColor,
        'location': 'Remote, Pan India',
        'locationColor': kTechHubColor,
        'locationTextColor': kPrimaryColor,
        'description':
            'Work on both the frontend and backend of applications. A versatile role that involves building end-to-end features and systems.',
        'salary': '₹14-35 LPA',
        'skills': ['React', 'Node.js', 'MongoDB', 'DevOps', '+3 more'],
        'growth': '28% annual growth',
        'icon': Icons.layers_rounded,
      },
      {
        'title': 'Backend Developer',
        'match': '82% match',
        'demand': 'High Demand',
        'demandColor': kHighDemandColor,
        'demandTextColor': kSuccessColor,
        'location': 'Pune, Hyderabad',
        'locationColor': kTechHubColor,
        'locationTextColor': kPrimaryColor,
        'description':
            'Build and maintain server-side logic, databases, and APIs that power web applications. Ensure high performance and responsiveness.',
        'salary': '₹10-25 LPA',
        'skills': ['Node.js', 'Python', 'Go', 'Databases', 'APIs'],
        'growth': '22% annual growth',
        'icon': Icons.dns_rounded,
      },
      {
        'title': 'Cybersecurity Specialist',
        'match': '78% match',
        'demand': 'Medium Demand',
        'demandColor': kMediumDemandColor,
        'demandTextColor': kWarningColor,
        'location': 'Government, BFSI',
        'locationColor': kTechHubColor,
        'locationTextColor': kPrimaryColor,
        'description':
            'Protect computer systems and networks from security threats and cyber attacks. Implement security measures and monitor for vulnerabilities.',
        'salary': '₹12-38 LPA',
        'skills': ['Network Security', 'Penetration Testing', 'Cryptography', 'SIEM'],
        'growth': '33% annual growth',
        'icon': Icons.security_rounded,
      },
    ];

    return Column(
      children: careerPaths
          .map((path) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CareerPathCard(
                  title: path['title'] as String,
                  match: path['match'] as String,
                  demand: path['demand'] as String,
                  demandColor: path['demandColor'] as Color,
                  demandTextColor: path['demandTextColor'] as Color,
                  location: path['location'] as String,
                  locationColor: path['locationColor'] as Color,
                  locationTextColor: path['locationTextColor'] as Color,
                  description: path['description'] as String,
                  salary: path['salary'] as String,
                  skills: path['skills'] as List<String>,
                  growth: path['growth'] as String,
                  icon: path['icon'] as IconData,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildExploreSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore More Opportunities",
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
              _buildExploreCard("AI/ML Engineer", Icons.smart_toy_rounded, kPrimaryColor),
              _buildExploreCard("UI/UX Designer", Icons.palette_rounded, kAccentColor),
              _buildExploreCard("DevOps Engineer", Icons.cloud_rounded, kSuccessColor),
              _buildExploreCard("Blockchain Dev", Icons.link_rounded, kWarningColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExploreCard(String title, IconData icon, Color color) {
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

class CareerPathCard extends StatelessWidget {
  final String title;
  final String match;
  final String demand;
  final Color demandColor;
  final Color demandTextColor;
  final String location;
  final Color locationColor;
  final Color locationTextColor;
  final String description;
  final String salary;
  final List<String> skills;
  final String growth;
  final IconData icon;

  const CareerPathCard({
    super.key,
    required this.title,
    required this.match,
    required this.demand,
    required this.demandColor,
    required this.demandTextColor,
    required this.location,
    required this.locationColor,
    required this.locationTextColor,
    required this.description,
    required this.salary,
    required this.skills,
    required this.growth,
    required this.icon,
  });

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
      child: Padding(
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section with title, icon, and match
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: kPrimaryColor,
                    size: 24,
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
                          fontSize: Responsive.getResponsiveFontSize(context, 20),
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        match,
                        style: TextStyle(
                          color: kPrimaryGreen,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Tags section
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: demandColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    demand,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: demandTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: locationColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    location,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: locationTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Description
            Text(
              description,
              style: TextStyle(
                color: kSecondaryTextColor,
                height: 1.5,
                fontSize: Responsive.getResponsiveFontSize(context, 14),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Skills section
            Text(
              'Key Skills Required:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.getResponsiveFontSize(context, 14),
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: skills
                  .map((skill) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: kLightGreyColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Text(
                          skill,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kTextColor,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            
            const SizedBox(height: 20),
            
            // Salary and growth section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kLightGreyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average Salary',
                          style: TextStyle(
                            fontSize: 12,
                            color: kSecondaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          salary,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Growth Rate',
                          style: TextStyle(
                            fontSize: 12,
                            color: kSecondaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          growth,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kPrimaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Action button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement navigation to the roadmap screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'View Learning Roadmap',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
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