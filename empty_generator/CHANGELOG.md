## 0.0.3

- Added support for user-defined default values via the `@Default()` annotation from `empty_annotation`.

## 0.0.2

- Removed Flutter SDK dependency to make the package usable in pure Dart projects.
- Now compatible with both Dart and Flutter.
- Improved type safety and code generation reliability:
  - Added support for more Dart core types in default value generation, such as `dynamic`, `void`, `Object`, `Future`, `Stream`, etc.
 

## 0.0.1+1

- Initial release of `empty_generator`.
- Adds functionality to generate empty constructors for classes annotated with `empty_annotation`.
- Integrates with `build_runner` to automate code generation.
