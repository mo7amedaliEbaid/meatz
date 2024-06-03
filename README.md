# meatz

```css
lib/
├── application/
│   ├── auth/
│   │   ├── auth_bloc.dart
│   │   ├── auth_event.dart
│   │   └── auth_state.dart
├── domain/
│   ├── auth/
│   │   ├── auth_failure.dart
│   │   ├── i_auth_facade.dart
│   │   └── value_objects.dart
├── infrastructure/
│   ├── auth/
│   │   ├── auth_facade.dart
│   │   └── firebase_user_mapper.dart
├── presentation/
│   ├── auth/
│   │   ├── sign_in_form/
│   │   │   ├── sign_in_form_bloc.dart
│   │   │   ├── sign_in_form_event.dart
│   │   │   └── sign_in_form_state.dart
│   │   └── sign_in_page.dart
│   └── core/
│       └── app_widget.dart
└── main.dart

```
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_auth:
  google_sign_in:
  flutter_bloc:
  dartz:
```
