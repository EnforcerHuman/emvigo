# Machine Task

A Flutter mobile application with Firebase authentication and Firestore profile storage.

## Architecture

The app follows a layered architecture with **BLoC** for state management and **dependency injection** via `get_it`.

```
UI (Screens / Widgets)
    ↕ BLoC (Events → States)
    ↕ Controller (Business Logic)
    ↕ Service (Firebase SDK)
    ↕ Firebase (Auth / Firestore)
```

### Layers

- **`views/`** — Screens and UI widgets. Each screen uses `BlocConsumer` to dispatch events and react to states.
- **`blocs/`** — BLoC classes handle events (e.g. `StoreProfileDataEvent`), call controllers, and emit states (`ProfileLoading`, `ProfileSuccess`, `ProfileFailure`).
- **`controllers/`** — Thin layer that wraps services, converts exceptions into `bool` / nullable return values so BLoCs don't handle raw exceptions.
- **`services/`** — Direct Firebase SDK wrappers (`FirebaseAuthService`, `FirebaseStorageService`). Registered as singletons in the DI container.
- **`models/`** — Data classes (`UserProfileModel`) with `toMap()` / `fromJson()` serialization.
- **`core/`** — Shared constants (`AppColors`, `AppTextStyles`) and reusable widgets (`AppButton`, `AppTextField`, `AppDropDown`, `AppText`).
- **`controllers/di_controller.dart`** — Central `get_it` container that wires all dependencies.

### Data Flow

```
User taps "Continue"
    → ProfileBloc receives StoreProfileDataEvent
    → StorageController.storeData()
    → FirebaseStorageService stores in Firestore
    → Controller returns true/false
    → BLoC emits ProfileSuccess / ProfileFailure
    → UI shows snackbar
```

### Key Design Decisions

- **Document ID = User UID** — Each user's profile is stored at `user_profiles/{uid}` so reads/writes don't need a separate query.
- **`AppText` widget** — Uses `MediaQuery` to scale font size proportionally to screen width (reference: 375px). Set `maxLines: 1` to enable responsive scaling; omit for multi-line wrapping text.
- **Controllers over raw services in BLoCs** — Controllers catch and convert exceptions so BLoCs only deal with `bool` / nullable results.

## Packages Used

| Package | Purpose |
|---------|---------|
| `flutter_bloc` + `bloc` | State management (BLoC pattern) |
| `get_it` | Dependency injection / service locator |
| `firebase_core` | Firebase initialization |
| `firebase_auth` | Email/password authentication |
| `cloud_firestore` | Profile data storage |
| `google_fonts` | DM Serif Display & Outfit fonts |

## Setup

### Prerequisites

- Flutter SDK >= 3.11.4
- Android Studio / Xcode (for device builds)
- A Firebase project (the current config points to `strongify-d804d`)

### Steps

```bash
# 1. Install dependencies
flutter pub get

# 2. Run on device or emulator
flutter run

# 3. (Optional) Run analysis
flutter analyze
```

### Firebase Configuration

The project is pre-configured for **Android** with `google-services.json`. To point to your own Firebase project:

1. Create a Firebase project at https://console.firebase.google.com
2. Enable **Authentication** (Email/Password) and **Cloud Firestore**
3. Download the `google-services.json` for Android and place it at `android/app/google-services.json`
4. Re-run `flutterfire configure` to regenerate `lib/firebase_options.dart`

> **Note:** Only Android is currently configured. iOS, web, macOS, Windows, and Linux require additional Firebase setup.
