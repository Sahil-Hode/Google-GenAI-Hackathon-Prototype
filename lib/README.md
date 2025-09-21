# CareerAI - Flutter Application Library

A comprehensive Flutter application for career guidance and skill development, built for the GenAI Hackathon. This directory contains the core application logic, UI components, and utilities.

## 📁 Project Structure

```
lib/
├── main.dart                    # Application entry point and main configuration
├── screens/                     # UI screens and pages
│   ├── home_screen.dart        # Landing page with feature overview
│   ├── dashboard_screen.dart   # User progress dashboard
│   ├── career_paths_screen.dart # Career recommendations and paths
│   ├── skill_gap_screen.dart   # Skill analysis and learning paths
│   ├── roadmap_screen.dart     # Learning roadmap visualization
│   └── market_trends_screen.dart # Industry trends and insights
├── widgets/                     # Reusable UI components
│   ├── bottom_nav_bar.dart     # Responsive navigation bar
│   ├── debug_overlay.dart      # Development debugging overlay
│   └── responsive.dart         # Responsive design utilities
└── utils/
    └── constants.dart          # App-wide constants and colors
```

## 🎯 Core Features

### 1. **Home Screen** (`screens/home_screen.dart`)
- **Hero Section**: Responsive landing area with call-to-action buttons
- **Feature Grid**: Interactive cards showcasing app capabilities
- **Responsive Design**: Adapts to mobile, tablet, and desktop layouts
- **Key Features**:
  - Job Matching
  - Skill Gap Analysis
  - Resume Builder
  - AI Career Coach

### 2. **Dashboard Screen** (`screens/dashboard_screen.dart`)
- **Progress Tracking**: Visual skill completion metrics
- **Roadmap Progress**: Interactive learning path visualization
- **Recent Activities**: Timeline of user actions
- **Quick Actions**: Fast access to key features
- **Responsive Cards**: Adaptive layout for different screen sizes

### 3. **Career Paths Screen** (`screens/career_paths_screen.dart`)
- **Personalized Recommendations**: AI-driven career suggestions
- **Detailed Career Cards**: Comprehensive role information including:
  - Match percentage
  - Salary ranges
  - Required skills
  - Growth rates
  - Market demand
- **Explore Section**: Additional career opportunities

### 4. **Skill Gap Screen** (`screens/skill_gap_screen.dart`)
- **Skill Score Analysis**: Visual progress indicators
- **Learning Phases**: Structured skill development paths
- **Priority-based Learning**: High/Medium/Low priority skill categorization
- **Quick Actions**: Assessment and course recommendations

## 🎨 Design System

### Color Palette
```dart
// Primary Colors
kPrimaryColor: Color(0xFF7C4DFF)     // Modern purple
kPrimaryGreen: Color(0xFF34A853)     // Success green
kAccentColor: Color(0xFF03DAC6)      // Teal accent

// Background Colors
kLightGreyColor: Color(0xFFF8F9FA)   // Light background
kCardColor: Color(0xFFFFFFFF)        // Card background

// Text Colors
kTextColor: Color(0xFF1A1A1A)        // Primary text
kSecondaryTextColor: Color(0xFF6B7280) // Secondary text

// Status Colors
kSuccessColor: Color(0xFF10B981)     // Success states
kWarningColor: Color(0xFFF59E0B)     // Warning states
kErrorColor: Color(0xFFEF4444)       // Error states
```

### Responsive Breakpoints
- **Mobile**: < 650px width
- **Tablet**: 650px - 1100px width
- **Desktop**: > 1100px width

## 🧩 Key Components

### Navigation System (`widgets/bottom_nav_bar.dart`)
- **Responsive Navigation**: Adapts to screen size with overflow protection
- **Multiple Implementations**:
  - Custom responsive navigation
  - Material 3 navigation bar
  - Scrollable navigation for small screens
- **6 Navigation Items**: Home, Dashboard, Paths, Skills, Roadmap, Trends

### Responsive Utilities (`widgets/responsive.dart`)
- **Device Detection**: Mobile, tablet, desktop identification
- **Adaptive Layouts**: Conditional rendering based on screen size
- **Responsive Sizing**: Dynamic padding, font sizes, and spacing

### Debug Tools (`widgets/debug_overlay.dart`)
- **Development Overlay**: Screen size and device type display
- **Conditional Rendering**: Only shows when `kShowDebugOverlay` is enabled

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Google Fonts package
- Material Design 3 support

### Key Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^latest_version
  # Add other dependencies as needed
```

### Running the Application
```bash
# Navigate to the app directory
cd app/

# Get dependencies
flutter pub get

# Run the application
flutter run
```

## 📱 Screen Specifications

### Home Screen Features
- **Responsive Hero Section**: Adapts content layout for different screen sizes
- **Feature Cards**: Interactive grid with hover effects
- **Call-to-Action Buttons**: "Take Assessment" and "Watch Demo"
- **Image Fallback**: Graceful handling of missing assets

### Dashboard Features
- **Progress Visualization**: Linear progress bars and circular indicators
- **Metric Cards**: Skills completed, market demand, milestones
- **Activity Timeline**: Recent user actions and achievements
- **Quick Action Grid**: Fast access to key features

### Career Paths Features
- **Match Scoring**: Percentage-based career compatibility
- **Demand Indicators**: High/Medium/Low market demand tags
- **Salary Information**: Comprehensive compensation data
- **Skill Requirements**: Tagged skill lists with priorities
- **Growth Metrics**: Industry growth rate information

### Skill Gap Features
- **Skill Scoring**: 76% completion visualization
- **Learning Phases**: Structured 2-phase learning approach
- **Priority System**: Color-coded skill priorities
- **Time Estimates**: Learning duration for each skill

## 🎯 Technical Highlights

### Responsive Design
- **Adaptive Layouts**: Conditional rendering based on screen size
- **Flexible Typography**: Responsive font sizing
- **Dynamic Spacing**: Screen-size appropriate padding and margins
- **Overflow Protection**: Prevents UI breaking on small screens

### Performance Optimizations
- **Efficient Scrolling**: `BouncingScrollPhysics` for smooth interactions
- **Lazy Loading**: `GridView` and `ListView` optimizations
- **Memory Management**: Proper widget disposal and state management

### Code Organization
- **Modular Structure**: Separated screens, widgets, and utilities
- **Reusable Components**: Shared widgets across screens
- **Consistent Styling**: Centralized color and theme management
- **Clean Architecture**: Clear separation of concerns

## 🔧 Configuration

### Debug Mode
Toggle debug overlay in `main.dart`:
```dart
const bool kShowDebugOverlay = false; // Set to true for development
```

### Theme Customization
Modify colors in `utils/constants.dart` or individual screen files for theme variations.

### Navigation Configuration
Customize navigation items in `widgets/bottom_nav_bar.dart` by modifying the `_getNavigationItems()` method.

## 📈 Future Enhancements

- **State Management**: Integration with Provider/Bloc for complex state
- **API Integration**: Backend connectivity for dynamic data
- **Offline Support**: Local data caching and offline functionality
- **Animations**: Enhanced micro-interactions and transitions
- **Accessibility**: Improved screen reader and keyboard navigation support
- **Testing**: Unit and widget test coverage
- **Internationalization**: Multi-language support

## 🤝 Contributing

1. Follow Flutter/Dart style guidelines
2. Maintain responsive design principles
3. Update documentation for new features
4. Test across different screen sizes
5. Ensure accessibility compliance

## 📄 License

This project is part of the GenAI Hackathon submission.

---

**Built with ❤️ using Flutter for the GenAI Hackathon**