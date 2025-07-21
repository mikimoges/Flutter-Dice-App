# 🎲 Flutter Dice App

A simple Flutter app that simulates rolling dice with smooth animations.

![Dice App Preview](assets/dice_preview.gif) *(Add your preview image if available)*

## 🛠️ Setup Instructions

### 📥 Download this Repository

1. Click `Code` → `Download ZIP` on GitHub
2. Extract the contents to your computer

---

### 📁 Replace Files in Your New Project

> **Note:** Your Flutter project should be named `dice`.

1. Create a new Flutter project:
   ```bash
   flutter create dice
   ```

2. Copy all the following folders/files from this repo:
   - `lib/`
   - `assets/`
   - `pubspec.yaml`
   - `analysis_options.yaml`

3. Paste and overwrite them into your `dice/` project folder.

4. Install dependencies:
   ```bash
   flutter pub get
   ```

---

### 🧰 Method 2: Manual Setup

If you already have a Flutter project (not named `dice`):

1. Copy the following files/folders from this repo into your project:
   - `lib/`
   - `assets/`
   - `pubspec.yaml`
   - `analysis_options.yaml`

2. Run:
   ```bash
   flutter pub get
   ```

---

### ▶️ Running the App

```bash
flutter run
```

- **Android**: Connect a device or use an emulator  
- **iOS**: Requires macOS and Xcode

---

## 📁 Project Structure

```
dice/
├── lib/
│   └── main.dart              # App entry point
├── assets/                    # Dice images or animations
├── pubspec.yaml               # Dependencies and assets
└── analysis_options.yaml      # Code linting rules
```

---

## 📦 Dependencies

- [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) – State management
- [`lottie`](https://pub.dev/packages/lottie) – Smooth animations  
*(Update this list based on your actual `pubspec.yaml`)*

---

## 🚀 Features

- 🎲 Realistic dice rolling animation  
- 💡 Responsive layout  
- ⚡ Smooth transitions  
- 📱 Cross-platform (iOS, Android)

---

## 🤝 Contributing

Pull requests are welcome!  
For major changes, please open an issue first.
