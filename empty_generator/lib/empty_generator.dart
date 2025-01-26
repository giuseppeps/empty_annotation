library empty_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:empty_annotation/empty_annotation.dart';
import 'package:source_gen/source_gen.dart';

class EmptyGenerator extends GeneratorForAnnotation<Empty> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '@Empty can only be applied to classes.',
        element: element,
      );
    }

    final className = element.name;
    final fields = _collectFields(element).map((field) {
      return '${field.name}: ${_defaultValueForType(field.type)}';
    }).join(',\n      ');

    return '''
      class ${className}Empty extends $className{
        ${className}Empty() : super(
          $fields
        );
      }
    ''';
  }

  Iterable<FieldElement> _collectFields(ClassElement element) {
    final fields = <FieldElement>[];

    ClassElement? currentClass = element;
    while (currentClass != null) {
      fields.addAll(
        currentClass.fields.where((field) =>
            !field.isStatic && // Ignore static fields
            !field.isSynthetic && // Ignore params as hashCode and runtimeType
            field.isPublic),
      );

      currentClass = currentClass.supertype?.element is ClassElement
          ? currentClass.supertype?.element as ClassElement
          : null;
    }

    return fields;
  }

  bool _isEnum(Element element) {
    return element.toString().startsWith('enum');
  }

  String _defaultValueForType(DartType type) {
    final typeName = type.getDisplayString();

    if (typeName.endsWith('?')) return 'null';

    if (_isEnum(type.element!)) {
      return '$typeName.values.first';
    }

    if (typeName == 'int') return '0';
    if (typeName == 'double') return '0.0';
    if (typeName == 'String') return "''";
    if (typeName == 'bool') return 'false';
    if (typeName == 'DateTime') return 'DateTime.now()';
    if (typeName.startsWith('List')) return 'const []';
    if (typeName.startsWith('Map')) return 'const {}';
    if (typeName == 'Type') return 'null';

    return '${typeName}Empty()';
  }
}

/// Builder factory for generating empty methods.
Builder emptyGenerator(BuilderOptions options) =>
    SharedPartBuilder([EmptyGenerator()], 'empty');
