## 0.0.3

- Implemented the `@Default(...)` annotation to allow defining default values for class fields.
- Refactored internal generator structure: logic moved to multiple files under `src/` for better maintainability and scalability.

## 0.0.2

- Removed Flutter dependency to allow usage as a pure Dart code generator.
- Now compatible with both Dart and Flutter projects.

## 0.0.1+1

- Initial release of `empty_annotation`.
- Introduces the `Empty` annotation to be used in classes for generating empty constructors via `empty_generator`.
