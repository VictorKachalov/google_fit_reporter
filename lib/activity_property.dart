import 'property.dart';

class ActivityProperty extends Property {
  static const activity = ActivityProperty('activity');
  static const sleepSegmentType = ActivityProperty('sleep_segment_type');
  static const confidence = ActivityProperty('confidence');
  static const steps = ActivityProperty('steps');
  static const stepLength = ActivityProperty('step_length');
  static const duration = ActivityProperty('duration');
  static const bpm = ActivityProperty('bpm');
  static const latitude = ActivityProperty('latitude');
  static const longitude = ActivityProperty('longitude');
  static const accuracy = ActivityProperty('accuracy');
  static const altitude = ActivityProperty('altitude');
  static const distance = ActivityProperty('distance');
  static const height = ActivityProperty('height');
  static const weight = ActivityProperty('weight');
  static const percentage = ActivityProperty('percentage');
  static const speed = ActivityProperty('speed');
  static const rpm = ActivityProperty('rpm');
  static const revolutions = ActivityProperty('revolutions');
  static const calories = ActivityProperty('calories');
  static const watts = ActivityProperty('watts');
  static const volume = ActivityProperty('volume');
  static const mealType = ActivityProperty('meal_type');
  static const foodItem = ActivityProperty('food_item');
  static const nutrients = ActivityProperty('nutrients');
  static const exercise = ActivityProperty('exercise');
  static const repetitions = ActivityProperty('repetitions');
  static const resistance = ActivityProperty('resistance');
  static const resistanceType = ActivityProperty('resistance_type');
  static const numSegments = ActivityProperty('num_segments');
  static const average = ActivityProperty('average');
  static const max = ActivityProperty('max');
  static const min = ActivityProperty('min');
  static const lowLatitude = ActivityProperty('low_latitude');
  static const lowLongitude = ActivityProperty('low_longitude');
  static const highLatitude = ActivityProperty('high_latitude');
  static const highLongitude = ActivityProperty('high_longitude');
  static const occurrences = ActivityProperty('occurrences');
  static const intensity = ActivityProperty('intensity');
  static const circumference = ActivityProperty('circumference');

  const ActivityProperty(String string) : super(string);
}
