// bottom_nav_bar.dart
import 'package:flutter/material.dart';

// Updated color scheme
const Color kPrimaryColor = Color(0xFF2196F3);
const Color kSecondaryColor = Color(0xFF9C27B0);
const Color kBackgroundColor = Color(0xFFFFFFFF);
const Color kTextColor = Color(0xFF1A1A1A);
const Color kSecondaryTextColor = Color(0xFF757575);
const Color kInactiveColor = Color(0xFF9E9E9E);

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200,
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, -2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: _getNavBarHeight(screenWidth),
              child: Row(
                children: _buildNavigationItems(screenWidth),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildNavigationItems(double screenWidth) {
    final items = _getNavigationItems();
    final itemWidth = screenWidth / items.length;
    
    return items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isSelected = widget.selectedIndex == index;

      return SizedBox(
        width: itemWidth,
        child: _buildNavigationItem(
          item: item,
          index: index,
          isSelected: isSelected,
          screenWidth: screenWidth,
        ),
      );
    }).toList();
  }

  Widget _buildNavigationItem({
    required NavigationItemData item,
    required int index,
    required bool isSelected,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: () {
        widget.onItemTapped(index);
        if (isSelected) {
          _animationController.forward().then((_) {
            _animationController.reverse();
          });
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(screenWidth),
          vertical: _getVerticalPadding(screenWidth),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon section
            Flexible(
              flex: 3,
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: isSelected ? _scaleAnimation.value : 1.0,
                    child: Container(
                      padding: EdgeInsets.all(_getIconPadding(screenWidth)),
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? kPrimaryColor.withOpacity(0.1) 
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isSelected ? item.activeIcon : item.icon,
                        color: isSelected ? kPrimaryColor : kInactiveColor,
                        size: _getIconSize(screenWidth),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Text section
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(top: _getTextTopPadding(screenWidth)),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: _getFontSize(screenWidth),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected ? kPrimaryColor : kInactiveColor,
                    ),
                    child: Text(
                      _getDisplayLabel(item.label, screenWidth),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Responsive sizing methods
  double _getNavBarHeight(double screenWidth) {
    if (screenWidth < 320) return 60;  // Very small phones
    if (screenWidth < 360) return 65;  // Small phones
    if (screenWidth < 400) return 70;  // Regular phones
    if (screenWidth < 600) return 75;  // Large phones
    return 80;  // Tablets and larger
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 320) return 1.0;
    if (screenWidth < 360) return 2.0;
    if (screenWidth < 400) return 3.0;
    if (screenWidth < 600) return 4.0;
    return 6.0;
  }

  double _getVerticalPadding(double screenWidth) {
    if (screenWidth < 320) return 4.0;
    if (screenWidth < 360) return 6.0;
    if (screenWidth < 400) return 8.0;
    return 10.0;
  }

  double _getIconSize(double screenWidth) {
    if (screenWidth < 320) return 18.0;
    if (screenWidth < 360) return 20.0;
    if (screenWidth < 400) return 22.0;
    if (screenWidth < 600) return 24.0;
    return 26.0;
  }

  double _getIconPadding(double screenWidth) {
    if (screenWidth < 320) return 4.0;
    if (screenWidth < 360) return 5.0;
    if (screenWidth < 400) return 6.0;
    return 8.0;
  }

  double _getFontSize(double screenWidth) {
    if (screenWidth < 320) return 8.0;
    if (screenWidth < 360) return 9.0;
    if (screenWidth < 400) return 10.0;
    if (screenWidth < 600) return 11.0;
    return 12.0;
  }

  double _getTextTopPadding(double screenWidth) {
    if (screenWidth < 320) return 1.0;
    if (screenWidth < 360) return 2.0;
    if (screenWidth < 400) return 3.0;
    return 4.0;
  }

  String _getDisplayLabel(String label, double screenWidth) {
    if (screenWidth < 320) {
      // Ultra compact mode for very small screens
      switch (label) {
        case 'Dashboard': return 'Dash';
        case 'Skill Gap': return 'Skills';
        case 'Roadmap': return 'Map';
        default: return label;
      }
    } else if (screenWidth < 360) {
      // Compact mode for small screens
      switch (label) {
        case 'Dashboard': return 'Dashbo';
        case 'Skill Gap': return 'Skills';
        default: return label;
      }
    }
    // Full labels for larger screens
    return label;
  }

  List<NavigationItemData> _getNavigationItems() {
    return [
      NavigationItemData(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Home',
      ),
      NavigationItemData(
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard_rounded,
        label: 'Dashboard',
      ),
      NavigationItemData(
        icon: Icons.alt_route_outlined,
        activeIcon: Icons.alt_route_rounded,
        label: 'Paths',
      ),
      NavigationItemData(
        icon: Icons.analytics_outlined,
        activeIcon: Icons.analytics_rounded,
        label: 'Skill Gap',
      ),
      NavigationItemData(
        icon: Icons.map_outlined,
        activeIcon: Icons.map_rounded,
        label: 'Roadmap',
      ),
      NavigationItemData(
        icon: Icons.trending_up_outlined,
        activeIcon: Icons.trending_up_rounded,
        label: 'Trends',
      ),
    ];
  }
}

// Data class for navigation items
class NavigationItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  NavigationItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

// Alternative Material 3 Navigation Bar (No overflow guaranteed)
class Material3BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Material3BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onItemTapped,
        backgroundColor: Colors.transparent,
        elevation: 0,
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: kPrimaryColor.withOpacity(0.1),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.alt_route_outlined),
            selectedIcon: Icon(Icons.alt_route_rounded),
            label: 'Paths',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics_rounded),
            label: 'Skills',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map_rounded),
            label: 'Roadmap',
          ),
          NavigationDestination(
            icon: Icon(Icons.trending_up_outlined),
            selectedIcon: Icon(Icons.trending_up_rounded),
            label: 'Trends',
          ),
        ],
      ),
    );
  }
}

// Ultimate responsive navigation that auto-selects the best implementation
class UltimateResponsiveBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const UltimateResponsiveBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        
        // Choose the best navigation implementation based on screen size
        if (screenWidth > 600) {
          // For tablets and larger screens, use Material 3 NavigationBar
          return Material3BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          );
        } else {
          // For mobile screens, use our custom overflow-proof implementation
          return BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          );
        }
      },
    );
  }
}

// Scrollable bottom navigation for extremely small screens (Bonus)
class ScrollableBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ScrollableBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home_outlined, 'activeIcon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.dashboard_outlined, 'activeIcon': Icons.dashboard_rounded, 'label': 'Dashboard'},
      {'icon': Icons.alt_route_outlined, 'activeIcon': Icons.alt_route_rounded, 'label': 'Paths'},
      {'icon': Icons.analytics_outlined, 'activeIcon': Icons.analytics_rounded, 'label': 'Skills'},
      {'icon': Icons.map_outlined, 'activeIcon': Icons.map_rounded, 'label': 'Roadmap'},
      {'icon': Icons.trending_up_outlined, 'activeIcon': Icons.trending_up_rounded, 'label': 'Trends'},
    ];

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = selectedIndex == index;
              
              return GestureDetector(
                onTap: () => onItemTapped(index),
                child: Container(
                  width: 70,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? kPrimaryColor.withOpacity(0.1) 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isSelected 
                              ? item['activeIcon'] as IconData
                              : item['icon'] as IconData,
                          size: 20,
                          color: isSelected ? kPrimaryColor : kInactiveColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: isSelected ? kPrimaryColor : kInactiveColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
