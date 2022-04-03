import 'property.dart';

abstract class HealthType {
  const HealthType(this.string, this.properties);

  final String string;
  final List<Property> properties;
}
