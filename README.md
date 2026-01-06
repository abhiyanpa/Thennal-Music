# Thennal Music 🎵

<div align="center">
  <img src="assets/icon.png" alt="Thennal Music Logo" width="200"/>
  
  <p><strong>A beautiful, feature-rich music streaming app built with Flutter</strong></p>
  
  [![GitHub release](https://img.shields.io/github/v/release/abhiyanpa/Thennal-Music)](https://github.com/abhiyanpa/Thennal-Music/releases)
  [![License](https://img.shields.io/github/license/abhiyanpa/Thennal-Music)](LICENSE)
  [![Flutter](https://img.shields.io/badge/Flutter-3.38.5-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.9.10-blue.svg)](https://dart.dev/)
</div>

## ✨ Features

### 🎧 Music Playback
- **High-Quality Audio Streaming** - Stream music with multiple quality options (Low, Medium, High, Very High, Ultra)
- **Related Songs** - Discover similar songs with auto-play feature
- **Smart Auto-Play** - Automatically plays related songs when current track ends
- **Queue Management** - Full control over your playback queue
- **Background Playback** - Continues playing even when app is in background

### 📱 User Interface
- **Material Design 3** - Modern, beautiful interface with dynamic colors
- **Now Playing Screen** - Full-screen player with album artwork and controls
- **Mini Player** - Compact player bar for easy navigation
- **Dark Mode** - Elegant dark theme for comfortable viewing
- **Smooth Animations** - Polished transitions and interactions

### 📚 Library & Playlists
- **Create Playlists** - Organize your favorite songs
- **Custom Playlist Artwork** - Personalize your playlists
- **Search** - Quickly find songs, artists, and playlists
- **Library Management** - Keep all your music organized

### 🌍 Localization
Supports multiple languages including:
- English, Arabic, German, Greek, Spanish
- Estonian, French, Hebrew, Hindi, Hungarian
- Indonesian, Italian, Japanese, Korean
- Polish, Portuguese, Russian, Swedish
- Turkish, Ukrainian, Chinese (Simplified & Traditional)

### 🔧 Advanced Features
- **Firebase Integration** - Analytics and crash reporting
- **Proxy Support** - Connect through proxy servers
- **Offline Lyrics** - View synchronized lyrics
- **Update Notifications** - Stay up-to-date with the latest version

## 📸 Screenshots

<!-- Add screenshots here when available -->

## 🚀 Getting Started

### Download

Download the latest APK from the [Releases](https://github.com/abhiyanpa/Thennal-Music/releases) page.

### Building from Source

#### Prerequisites
- Flutter SDK 3.38.5 or higher
- Dart SDK 3.9.10 or higher
- Android Studio / VS Code with Flutter extensions

#### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/abhiyanpa/Thennal-Music.git
   cd Thennal-Music
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build APK**
   ```bash
   # GitHub flavor (default)
   flutter build apk --flavor github --release
   
   # F-Droid flavor
   flutter build apk --flavor fdroid --release
   ```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.38.5
- **Language**: Dart 3.9.10
- **Audio**: just_audio, audio_service
- **YouTube Integration**: youtube_explode_dart
- **Database**: Hive
- **Routing**: go_router
- **State Management**: ValueNotifier, StreamBuilder
- **Backend**: Firebase

## 📦 Key Dependencies

```yaml
just_audio: ^0.10.5          # Audio playback
audio_service: ^0.18.18      # Background audio
youtube_explode_dart: ^3.0.5 # YouTube API
hive: ^2.2.3                 # Local database
go_router: ^17.0.1           # Navigation
dynamic_color: ^1.8.0        # Material You colors
```

## 🎯 Roadmap

- [ ] Spotify integration
- [ ] Download songs for offline playback
- [ ] Equalizer support
- [ ] Social features (share playlists)
- [ ] iOS support
- [ ] Desktop support (Windows, macOS, Linux)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Special thanks to all contributors
- Icons and UI inspiration from Material Design 3
- Audio streaming powered by YouTube

## 📧 Contact

**Abhiyan PA** - [@abhiyanpa](https://github.com/abhiyanpa)

Project Link: [https://github.com/abhiyanpa/Thennal-Music](https://github.com/abhiyanpa/Thennal-Music)

---

<div align="center">
  <sub>Built with ❤️ using Flutter</sub>
</div>
