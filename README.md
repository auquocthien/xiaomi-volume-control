# Xiaomi Volume Control

A Flutter application that displays a volume control widget on the phone screen.

## Features

- 🎚️ Interactive slider to adjust volume
- 🔊 Visual volume indicator with dynamic icons
- 📱 Material Design 3 UI
- 🎯 Quick preset buttons (Mute, Medium, Maximum)
- 🔄 Real-time volume change detection

## Requirements

- Flutter SDK (>=3.0.0)
- Android: minSdkVersion 21 or higher
- iOS: iOS 9.0 or higher

## Installation

1. Clone the repository:
```bash
git clone https://github.com/auquocthien/xiaomi-volume-control.git
cd xiaomi-volume-control
```

2. Get dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Dependencies

- `volume_controller`: ^2.0.7 - For controlling device volume
- `flutter_lints`: ^2.0.0 - For code quality

## Permissions

### Android
The app requires `MODIFY_AUDIO_SETTINGS` permission which is automatically added in AndroidManifest.xml

### iOS
No special permissions required for volume control on iOS.

## Project Structure

```
xiaomi-volume-control/
├── lib/
│   └── main.dart          # Main application file with volume control widget
├── android/               # Android-specific configuration
├── ios/                   # iOS-specific configuration
├── pubspec.yaml           # Project dependencies
└── README.md              # This file
```

## Usage

The app provides three main controls:

1. **Slider**: Drag to adjust volume from 0% to 100%
2. **Quick Buttons**:
   - Tắt tiếng (Mute): Set volume to 0%
   - Trung bình (Medium): Set volume to 50%
   - Tối đa (Maximum): Set volume to 100%

The volume icon changes automatically based on the current volume level.