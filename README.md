# ثقة الإقليم (Thiqat Al Iqleem)

## Main idea

A two-sided local services marketplace, Arabic-first (RTL). Three roles share one platform:

- **Clients** browse service categories, search and compare specialists, read ratings and reviews, book a service by choosing a day and time, track previous bookings, rebook, and leave reviews.
- **Specialists** sign up with professional details and verification documents, receive booking requests in an inbox, and accept or manage them.
- **Admin** reviews specialist verification and oversees the platform.

Trust is the core value: specialists are verified and rated before clients book them.

## Tools and technologies

| Area | Tool | Purpose |
|---|---|---|
| Framework | Flutter (Dart SDK ^3.12.1) | Cross-platform app (Android, iOS, web, desktop) |
| State management | `flutter_bloc` (Cubit), `equatable` | Presentation state per feature |
| Functional style | `dartz` | `Either`-based error handling in repositories |
| Backend: auth | Firebase Auth (`firebase_auth`, `firebase_core`) | Email, phone, Google and Apple sign-in |
| Backend: database | Cloud Firestore (`cloud_firestore`) | Users, bookings, specialists, reviews |
| Backend: storage | Supabase (`supabase_flutter`) | Verification documents and images |
| Social login | `google_sign_in`, `sign_in_with_apple`, `crypto` | Provider sign-in and nonce hashing |
| Localization | `intl`, `flutter_localizations`, `intl_utils` | Arabic-first strings (`lib/l10n/intl_ar.arb`) |
| UI | `flutter_svg`, `dots_indicator`, `skeletonizer`, `fl_chart` | SVG assets, onboarding indicators, loading skeletons, rating charts |
| Media | `image_picker` | Profile photos and document upload |
| Device | `url_launcher`, `shared_preferences` | Phone calls, local settings |
| Design | Cairo font (variable), `AppColor`, `AppTextStyle` | Consistent design system |
| Tooling | `flutter_launcher_icons`, `device_preview`, `flutter_lints` | App icon, responsive previews, linting |

## Architecture

Feature-first with a data/presentation split under `lib/features/<feature>/`:

```
data/          model + repository (remote data access)
presentation/  cubit (state) + view (screens, widgets)
<feature>.dart barrel file
```

Shared code lives in `lib/shared/` (models, enums, auth) and app-wide code in `lib/core/` (theme, utils, services, widgets).

## Setup

1. Install Flutter and run `flutter pub get`.
2. Firebase config files are not in the repo. Run `flutterfire configure` to generate `lib/firebase_options.dart`, and place your `google-services.json` in `android/app/`.
3. After editing `lib/l10n/intl_ar.arb`, run `dart run intl_utils:generate`.
4. Run with `flutter run`.
