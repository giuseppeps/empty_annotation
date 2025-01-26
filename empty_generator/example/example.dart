// ignore_for_file: avoid_print

import 'package:empty_annotation/empty_annotation.dart';

/// Make sure the `part` is specified before running the builder.
/// part 'example.g.dart';

@Empty()
class ExampleClass {
  final int id;
  final String name;

  ExampleClass({required this.id, required this.name});
}

// Comment this class when the code is generated by the builder.
class ExampleClassEmpty extends ExampleClass {
  ExampleClassEmpty() : super(id: 0, name: '');
}

void main() {
  // Run `dart run build_runner build` first to generate the code
  final emptyInstance = ExampleClassEmpty();
  print('Generated empty instance: $emptyInstance');
}
