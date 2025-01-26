[![Pub Package](https://img.shields.io/pub/v/v-empty_generator.svg)](https://pub.dev/packages/empty_generator)

This package provides a builder for the [Dart Build System](https://pub.dev/packages/build) that generates `Empty` constructors for classes annotated with [empty_annotation](https://pub.dev/packages/empty_annotation). For a detailed explanation of how this package works, check out [my blog article](https://yourblog.com/article-about-empty-generator).

This library allows you to generate empty constructors for classes, like so:

```dart
myInstance = MyClassEmpty(); // Generate an empty instance of MyClass.
```


## Usage

#### In your `pubspec.yaml` file
- Add to dependencies section empty_annotation: ^1.0.0
- Add to dev_dependencies section empty_generator: ^1.0.0
- Add to dev_dependencies section build_runner: ^2.1.7
- Set environment to at least Dart 3.0.0 version like so: ">=3.0.0 <4.0.0"

Your `pubspec.yaml` should look like so:

```yaml
environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  ...
  empty_annotation: ^1.0.0
  
dev_dependencies:
  ...
  build_runner: ^2.4.13
  empty_generator: ^1.0.0
```

#### Annotate your class with `Empty` annotation

```dart
import 'package:empty_annotation/empty_annotation.dart';

part 'your_class.g.dart';

@Empty()
class YourClass {
  final String name;
  final int age;

  YourClass({required this.name, required this.age});
}
```

Make sure that you set the part file as shown in the example above: `part 'your_file_name.g.dart';`.

#### Launch code generation

```bash
flutter pub run build_runner build
```

#### Use

```dart
final emptyInstance = YourClassEmpty();
print('Generated empty instance: $emptyInstance');
```

## Additional features

#### Generate Empty Constructor
The package generates an empty constructor for your class:
```dart
final emptyInstance = YourClassEmpty(); // Creates an empty instance
```

#### `build.yaml` configuration

You can globally configure the library's behavior in your project by adding a `build.yaml` file.

```yaml
targets:
  $default:
    builders:
      empty_generator:
        enabled: true
```
