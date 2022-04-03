import 'exceptions.dart';

abstract class Property {
  const Property(this.string);

  final String string;
}

enum PropertyFormat { integer, float, string, map }

extension PeropertyFormatId on PropertyFormat {
  int get id {
    switch (this) {
      case PropertyFormat.integer:
        return 1;
      case PropertyFormat.float:
        return 2;
      case PropertyFormat.string:
        return 3;
      case PropertyFormat.map:
        return 4;
    }
  }
}

extension PeropertyFormatFactory on PropertyFormat {
  static PropertyFormat createFrom(int id) {
    switch (id) {
      case 1:
        return PropertyFormat.integer;
      case 2:
        return PropertyFormat.float;
      case 3:
        return PropertyFormat.string;
      case 4:
        return PropertyFormat.map;
    }
    throw InvalidValueException('Unknown format: $id');
  }
}
