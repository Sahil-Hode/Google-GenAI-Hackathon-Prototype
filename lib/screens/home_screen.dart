import 'package:flutter/material.dart';

// Updated color scheme with purple theme as per your preference
const Color kPrimaryColor = Color(0xFF7C4DFF); // Updated to purple
const Color kPrimaryGreen = Color(0xFF34A853);
const Color kLightGreyColor = Color(0xFFF8F9FA);
const Color kTextColor = Color(0xFF1A1A1A);
const Color kSecondaryTextColor = Color(0xFF6B7280);
const Color kCardColor = Color(0xFFFFFFFF);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(_getResponsivePadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                SizedBox(height: _getResponsiveHeight(context, 40)),
                const FeatureGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 16.0; // Mobile
    if (width < 1200) return 24.0; // Tablet
    return 32.0; // Desktop
  }

  double _getResponsiveHeight(BuildContext context, double baseHeight) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return baseHeight * 0.8; // Mobile
    return baseHeight; // Tablet and Desktop
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kCardColor,
                kCardColor.withOpacity(0.95),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
        );
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeroImage(context, true),
        const SizedBox(height: 24),
        _buildTextContent(context, true),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: _buildTextContent(context, false),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 2,
            child: _buildHeroImage(context, false),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = isMobile ? (screenWidth < 360 ? 24.0 : 28.0) : 36.0;
    
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Everything You Need for Career Success',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: kTextColor,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our comprehensive platform provides all the tools and insights you need to make informed career decisions and achieve your professional goals.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: kSecondaryTextColor,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        _buildActionButtons(isMobile),
      ],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          child: const Text(
            'Take Assessment',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: kPrimaryColor.withOpacity(0.3)),
            foregroundColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Watch Demo',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroImage(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive sizing for different screen sizes
    double imageHeight;
    if (screenWidth < 400) {
      imageHeight = 180.0; // Very small phones
    } else if (screenWidth < 600) {
      imageHeight = 200.0; // Small phones
    } else if (screenWidth < 900) {
      imageHeight = 250.0; // Tablets
    } else {
      imageHeight = 300.0; // Desktop
    }
    
    return Container(
      height: imageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'asset/images/team-collaboration.jpeg',
          height: imageHeight,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to gradient with icon if image fails to load
            return Container(
              height: imageHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kPrimaryColor.withOpacity(0.8),
                    kPrimaryGreen.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.rocket_launch_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int crossAxisCount;
        double childAspectRatio;
        
        if (width < 600) {
          // Mobile
          crossAxisCount = 1;
          childAspectRatio = 1.4;
        } else if (width < 900) {
          // Tablet
          crossAxisCount = 2;
          childAspectRatio = 1.1;
        } else {
          // Desktop
          crossAxisCount = 4;
          childAspectRatio = 0.85;
        }

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: childAspectRatio,
          children: const [
            FeatureCard(
              icon: Icons.lightbulb_outline_rounded,
              iconColor: kPrimaryColor,
              title: 'Job Matching',
              description: 'Get personalized career suggestions based on your interests and market trends.',
              actionText: 'Get Matched',
            ),
            FeatureCard(
              icon: Icons.analytics_outlined,
              iconColor: kPrimaryGreen,
              title: 'Skill Gap Analysis',
              description: 'Identify exactly what skills you need to reach your dream career and get a personalized learning plan.',
              actionText: 'Analyze Skills',
            ),
            FeatureCard(
              icon: Icons.description_outlined,
              iconColor: Color(0xFFFF9500),
              title: 'Resume Builder',
              description: 'Create ATS-optimized resumes with AI and get higher interview call rates.',
              actionText: 'Build Resume',
            ),
            FeatureCard(
              icon: Icons.chat_bubble_outline_rounded,
              iconColor: Color(0xFFAF52DE),
              title: 'AI Career Coach',
              description: '24/7 personalized guidance, interview prep, and career advice through our AI chatbot.',
              actionText: 'Start Chatting',
            ),
          ],
        );
      },
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String actionText;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade100,
          width: 1,
        ),
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 28,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColor,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: kSecondaryTextColor,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      actionText,
                      style: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: iconColor,
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
