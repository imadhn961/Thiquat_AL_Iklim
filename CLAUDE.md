# ثقة الإقليم (Thiqat Al Iqleem)

Two-sided local services marketplace app (clients ↔ specialists ↔ admin). Flutter, Arabic-first (RTL), MVVM.

## Architecture — feature-first, data/presentation split

Every feature under `lib/features/<feature>/` follows this exact layout — replicate it for every new feature, do not deviate:

```
features/<feature>/
├── data/
│   ├── model/<feature>_model.dart        # plain data class
│   └── <feature>_repository.dart         # remote/local data access
├── presentation/
│   ├── view/<feature>_screen.dart        # StatelessWidget/StatefulWidget
│   └── viewmodel/<feature>_viewmodel.dart# ChangeNotifier
└── <feature>.dart                        # barrel: exports data/ + presentation/
```

- State management is **ChangeNotifier-based MVVM only** — no Bloc/Riverpod/GetX. ViewModels extend `ChangeNotifier`.
- Never put business logic in `view/` — screens read from the ViewModel only.
- Always add/update the feature's barrel file (`<feature>.dart`) when adding files so imports stay `import 'package:thiquat_al_iklim/features/<feature>/<feature>.dart'`.
- Cross-feature shared types go in `lib/shared/models/` and `lib/shared/enums/`, not inside a feature folder.
- App-wide, non-feature-specific code goes in `lib/core/` (`constants/`, `theme/`, `utils/`, `errors/`, `network/`, `services/` for Firebase wrappers, `routing/` for GoRouter, `widgets/` for shared widgets).

## Design system — always use these, never hardcode

- Colors: `lib/core/utils/app_color.dart` → `AppColor` class. Use `AppColor.roleCTA`, `AppColor.statusError`, `AppColor.textPrimary`, etc. Never inline a hex color in a widget — add it to `AppColor` first if a new one is needed.
- Text styles: `lib/core/utils/app_text_style.dart` → `AppTextStyle` class. Fields are named by pixel size, e.g. `AppTextStyle.TextSize28`, `TextSize19` (PascalCase is intentional here, not a typo — keep new sizes in the same `TextSize<N>` pattern and add `// ignore_for_file: constant_identifier_names` stays in that file).
- Font: **Cairo only**, variable font at `assets/fonts/Cairo/Cairo-Variable.ttf`, registered as family `Cairo` in `pubspec.yaml`. Don't add other font families without being asked.

## Localization (intl / Flutter Intl plugin, not flutter's built-in gen-l10n)

- Source strings live in `lib/l10n/intl_ar.arb` (this is the **main/template locale** — `main_locale: ar` is set in `pubspec.yaml`'s `flutter_intl:` block because content is Arabic-first). `intl_en.arb` exists but is currently empty.
- Generated code (`lib/generated/l10n.dart`, `lib/generated/intl/messages_*.dart`) is produced by `intl_utils`, **not** written by hand.
- **Critical**: after adding/editing any key in an `.arb` file, you must run `dart run intl_utils:generate` — otherwise `S.of(context).yourNewKey` will not exist yet, even though the arb file has it. This bit us once already; don't skip it.
- Access strings via `S.of(context).<key>` (`S` from `package:thiquat_al_iklim/generated/l10n.dart`). Never hardcode Arabic/English UI strings inline — add a key to `intl_ar.arb` instead.
