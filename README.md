# puvadon_jenosize

This project is built using Clean Architecture combined with the MVVM pattern, leveraging GetX for state management.
It includes simple unit tests and UI tests to ensure code quality and functionality.

The project supports multiple environments:

Developer

Production

Both environments are configured to handle native environment variables for platform-specific configurations.

## Getting Started

- Install fvm for flutter version control read more `https://fvm.app/` (optional but refer)
- Add credential
  - Update value environment variable in file `.env`
  - Add keystore file for android in folder `android/app/` and update value in file `key.properties` in folder `android/`
- Run make command `make project/init`
- In vs code tab RUN AND DEBUG you will see build config (`/.vscode/launch.json`)

## list of core package used in this project

- [getX] (https://pub.dev/packages/get)
- [dio] (https://pub.dev/packages/dio)
- [flutter_secure_storage] (https://pub.dev/packages/flutter_secure_storage)
- [flutter_config] (https://pub.dev/packages/flutter_config)
- [flutter_gen] (https://pub.dev/packages/flutter_gen)
- [flutter_flavor] (https://pub.dev/packages/flutter_flavor)

## Project Structure

```
lib
├── common
│   └── assets
│       ├── assets.gen.dart
│       └── fonts.gen.dart
├── main_developer.dart
├── main_production.dart
└── src
    ├── common
    │   ├── assets
    │   │   ├── assets.gen.dart
    │   │   └── fonts.gen.dart
    │   ├── constants
    │   │   └── constants.dart
    │   ├── enums
    │   │   └── global_enums.dart
    │   ├── themes
    │   │   ├── color_theme.dart
    │   │   ├── size_theme.dart
    │   │   └── text_theme.dart
    │   └── translation
    │       └── translation_config.dart
    ├── core
    │   ├── errors
    │   │   ├── constants
    │   │   │   └── constants.dart
    │   │   ├── models
    │   │   │   ├── failure_model.dart
    │   │   │   └── failure_model.g.dart
    │   │   └── translation
    │   │       ├── error_i18n_en.dart
    │   │       ├── error_i18n_key.dart
    │   │       └── error_i18n_th.dart
    │   ├── navigation
    │   │   ├── navigation_core.dart
    │   │   └── route_tracking_observer.dart
    │   ├── networks
    │   │   ├── dio_core.dart
    │   │   ├── on_convert_to_model.dart
    │   │   └── on_network_call.dart
    │   ├── secure_storage_core.dart
    │   └── translation_core.dart
    └── modules
        ├── app_module.dart
        ├── app.dart
        ├── campaign_module
        │   ├── campaign_module.dart
        │   ├── config
        │   │   ├── constants
        │   │   ├── routes
        │   │   └── translation
        │   ├── data
        │   │   ├── data_sources
        │   │   ├── models
        │   │   └── repositories_impl
        │   ├── domain
        │   │   ├── entities
        │   │   ├── repositories
        │   │   └── usecases
        │   ├── helper
        │   │   └── campaign_helper.dart
        │   └── presentation
        │       ├── view
        │       ├── view_model
        │       └── widget
        ├── core_widget_module
        │   ├── core_widget_module.dart
        │   └── widget
        │       ├── app_bar_widget.dart
        │       └── image_network_widget.dart
        └── profile_module
            ├── config
            │   ├── constants
            │   ├── routes
            │   └── translation
            ├── data
            ├── domain
            │   └── entities
            ├── presentation
            │   ├── view
            │   ├── view_model
            │   └── widget
            └── profile_module.dart
```

# Naming Conventions

- **File Naming**: Use lowercase letters and separate words with underscores for file names (`moduleName_function`) (e.g., `user_repository.dart`).

- **Class Naming**: Use CamelCase for class names (e.g., `UserEntity`, `GetUsersController`).

- **Variable and Function Naming**: Use CamelCase for variable and function naming (e.g., `myVariable`, `calculateSum()`).

- **Constants**: Use uppercase letters and separate words with underscores (e.g., `MAX_VALUE`, `API_KEY`).

# Code Conventions

- **Indentation**: Use 2 or 4 spaces for indentation. Be consistent throughout your codebase.

- **Line Length**: Keep lines within 80 characters for readability.

- **Imports**: Use separate lines for each import statement. Group and order imports: Dart core libraries first, followed by third-party packages, then your own project files.

- **Commenting**: Use `//` for short comments, `///` for documentation, and write meaningful comments that explain why something is done.

## Run test and coverage

Sample unit test in `/test`

- install lcov `brew install lcov`
- run test `make project/test`
