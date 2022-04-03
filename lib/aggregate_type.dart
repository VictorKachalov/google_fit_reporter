import 'activity_property.dart';
import 'health_type.dart';
import 'property.dart';
import 'vital_property.dart';

class AggregateType extends HealthType {
  static const stepCountDelta =
      AggregateType('com.google.step_count.delta', [ActivityProperty.steps]);
  static const activitySegment =
      AggregateType('com.google.activity.segment', [ActivityProperty.activity]);
  static const caloriesExpended = AggregateType(
      'com.google.calories.expended', [ActivityProperty.calories]);
  static const basalMetabolicRate =
      AggregateType('com.google.calories.bmr', [ActivityProperty.calories]);
  static const powerSample =
      AggregateType('com.google.power.sample', [ActivityProperty.watts]);
  static const heartRateBPM =
      AggregateType('com.google.heart_rate.bpm', [ActivityProperty.bpm]);
  static const locationSample = AggregateType('com.google.location.sample', [
    ActivityProperty.latitude,
    ActivityProperty.longitude,
    ActivityProperty.accuracy,
    ActivityProperty.altitude
  ]);
  static const distanceDelta =
      AggregateType('com.google.distance.delta', [ActivityProperty.distance]);
  static const speed =
      AggregateType('com.google.speed', [ActivityProperty.speed]);
  static const height =
      AggregateType('com.google.height', [ActivityProperty.height]);
  static const weight =
      AggregateType('com.google.weight', [ActivityProperty.weight]);
  static const bodyFatPercentage = AggregateType(
      'com.google.body.fat.percentage', [ActivityProperty.percentage]);
  static const nutrition = AggregateType('com.google.nutrition', [
    ActivityProperty.nutrients,
    ActivityProperty.mealType,
    ActivityProperty.foodItem
  ]);
  static const hydration =
      AggregateType('com.google.hydration', [ActivityProperty.volume]);
  static const moveMinutes =
      AggregateType('com.google.active_minutes', [ActivityProperty.duration]);
  static const heartPoints =
      AggregateType('com.google.heart_minutes', [ActivityProperty.intensity]);
  static const bloodPressure = AggregateType('com.google.blood_pressure', [
    VitalProperty.bloodPressureSystolic,
    VitalProperty.bloodPressureDiastolic,
    VitalProperty.bodyPosition,
    VitalProperty.bloodPressureMeasurementLocation
  ]);
  static const bloodGlucose = AggregateType('com.google.blood_glucose', [
    VitalProperty.bloodGlucoseLevel,
    VitalProperty.temporalRelationToMeal,
    ActivityProperty.mealType,
    VitalProperty.temporalRelationToSleep,
    VitalProperty.bloodGlucoseSpecimenSource
  ]);
  static const oxygenSaturation =
      AggregateType('com.google.oxygen_saturation', [
    VitalProperty.oxygenSaturation,
    VitalProperty.supplementalOxygenFlowRate,
    VitalProperty.oxygenTherapyAdministrationMode,
    VitalProperty.oxygenSaturationSystem,
    VitalProperty.oxygenSaturationMeasurementMethod
  ]);
  static const bodyTemperature = AggregateType('com.google.body.temperature', [
    VitalProperty.bodyTemperature,
    VitalProperty.bodyTemperatureMeasurementLocation
  ]);
  static const cervicalMucus = AggregateType('com.google.cervical_mucus',
      [VitalProperty.cervicalMucusTexture, VitalProperty.cervicalMucusAmount]);
  static const cervicalPosition =
      AggregateType('com.google.cervical_position', [
    VitalProperty.cervicalPosition,
    VitalProperty.cervicalDilation,
    VitalProperty.cervicalFirmness
  ]);
  static const menstruation =
      AggregateType('com.google.menstruation', [VitalProperty.menstrualFlow]);
  static const ovulationTest = AggregateType(
      'com.google.ovulation_test', [VitalProperty.ovulationTestResult]);
  static const vaginalSpotting = AggregateType(
      'com.google.vaginal_spotting', [ActivityProperty.occurrences]);

  const AggregateType(String string, List<Property> properties)
      : super(string, properties);
}
