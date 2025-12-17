# WorkOut!

A modern iOS workout application built with SwiftUI, designed to help users track and manage their fitness routines with an intuitive, polished interface.

## Overview

WorkOut is a native iOS application that combines clean design with powerful functionality. The app follows iOS 26 design patterns and prioritizes user experience through smooth animations, haptic feedback, and accessibility features.

## Features

### Core Functionality
- **Workout Tracking** — Log and monitor your exercise sessions
- **Progress Visualization** — View your fitness journey over time
- **Custom Routines** — Create and save personalized workout plans

### Settings & Personalization
- **In-App Language Selection** — Change languages without leaving the app (English, Spanish, French, German, Portuguese)
- **Visual Language Recognition** — Flag emojis and native language names for easy identification
- **Persistent Preferences** — Settings saved via UserDefaults across sessions

### User Experience
- **Modern iOS Design** — Consistent with contemporary iOS design standards
- **Smooth Animations** — Spring animations for fluid interface transitions
- **Haptic Feedback** — Tactile responses for enhanced interaction
- **Accessibility Support** — Designed with all users in mind

## Technical Details

### Requirements
- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

### Architecture
The app uses SwiftUI with a view-based architecture:

```
WorkOut/
├── ContentView.swift          # App entry point with launch screen handling
├── MainAppView.swift          # Primary navigation container
├── LaunchScreenView.swift     # Branded splash screen
├── Views/
│   ├── Settings/              # Settings and preferences
│   └── Workouts/              # Workout tracking screens
└── Models/                    # Data models and persistence
```

### Key Patterns
- **@State and @Binding** for reactive UI updates
- **UserDefaults** for lightweight preference storage
- **DispatchQueue** for timed transitions
- **withAnimation** for declarative animations

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/WorkOut.git
   ```

2. **Open in Xcode**
   ```bash
   cd WorkOut
   open WorkOut.xcodeproj
   ```

3. **Select a simulator or device**
   Choose your target device from the Xcode toolbar

4. **Build and run**
   Press `Cmd + R` or click the Play button

## Internationalization

The app supports multiple languages with an extensible localization system:

| Language | Code | Status |
|----------|------|--------|
| English | en | ✅ Supported |
| Spanish | es | ✅ Supported |
| French | fr | ✅ Supported |
| German | de | ✅ Supported |
| Portuguese | pt | ✅ Supported |

Adding new languages is straightforward — the settings infrastructure was designed for easy expansion.

## Roadmap

- [ ] Workout history and statistics
- [ ] HealthKit integration
- [ ] Cloud sync with iCloud
- [ ] Apple Watch companion app
- [ ] Social sharing features
- [ ] Additional language support

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This project is available under the MIT License. See the LICENSE file for details.

---

Built with ❤️ using SwiftUI
