import 'activity_property.dart';
import 'health_type.dart';
import 'property.dart';
import 'vital_property.dart';

class DetailType extends HealthType {
  static const stepCountDelta =
      DetailType('com.google.step_count.delta', [ActivityProperty.steps]);
  static const stepCountCumulative =
      DetailType('com.google.step_count.cumulative', [ActivityProperty.steps]);
  static const stepCountCadence =
      DetailType('com.google.step_count.cadence', [ActivityProperty.rpm]);
  static const activitySegment =
      DetailType('com.google.activity.segment', [ActivityProperty.activity]);
  static const sleepSegment = DetailType(
      'com.google.sleep.segment', [ActivityProperty.sleepSegmentType]);
  static const caloriesExpended =
      DetailType('com.google.calories.expended', [ActivityProperty.calories]);
  static const basalMetabolicRate =
      DetailType('com.google.calories.bmr', [ActivityProperty.calories]);
  static const powerSample =
      DetailType('com.google.power.sample', [ActivityProperty.watts]);
  static const heartRateBPM =
      DetailType('com.google.heart_rate.bpm', [ActivityProperty.bpm]);
  static const locationSample = DetailType('com.google.location.sample', [
    ActivityProperty.latitude,
    ActivityProperty.longitude,
    ActivityProperty.accuracy,
    ActivityProperty.altitude
  ]);
  static const distanceDelta =
      DetailType('com.google.distance.delta', [ActivityProperty.distance]);
  static const speed = DetailType('com.google.speed', [ActivityProperty.speed]);
  static const cyclingWheelRevolution = DetailType(
      'com.google.cycling.wheel_revolution.cumulative',
      [ActivityProperty.revolutions]);
  static const cyclingWheelRPM = DetailType(
      'com.google.cycling.wheel_revolution.rpm', [ActivityProperty.rpm]);
  static const cyclingPedalingCumulative = DetailType(
      'com.google.cycling.pedaling.cumulative', [ActivityProperty.revolutions]);
  static const cyclingPedalingCadence =
      DetailType('com.google.cycling.pedaling.cadence', [ActivityProperty.rpm]);
  static const height =
      DetailType('com.google.height', [ActivityProperty.height]);
  static const weight =
      DetailType('com.google.weight', [ActivityProperty.weight]);
  static const bodyFatPercentage = DetailType(
      'com.google.body.fat.percentage', [ActivityProperty.percentage]);
  static const nutrition = DetailType('com.google.nutrition', [
    ActivityProperty.nutrients,
    ActivityProperty.mealType,
    ActivityProperty.foodItem
  ]);
  static const hydration =
      DetailType('com.google.hydration', [ActivityProperty.volume]);
  static const workoutExercise = DetailType('com.google.activity.exercise', [
    ActivityProperty.exercise,
    ActivityProperty.repetitions,
    ActivityProperty.resistanceType,
    ActivityProperty.resistance
  ]);
  static const moveMinutes =
      DetailType('com.google.active_minutes', [ActivityProperty.duration]);
  static const heartPoints =
      DetailType('com.google.heart_minutes', [ActivityProperty.intensity]);
  static const bloodPressure = DetailType('com.google.blood_pressure', [
    VitalProperty.bloodPressureSystolic,
    VitalProperty.bloodPressureDiastolic,
    VitalProperty.bodyPosition,
    VitalProperty.bloodPressureMeasurementLocation
  ]);
  static const bloodGlucose = DetailType('com.google.blood_glucose', [
    VitalProperty.bloodGlucoseLevel,
    VitalProperty.temporalRelationToMeal,
    ActivityProperty.mealType,
    VitalProperty.temporalRelationToSleep,
    VitalProperty.bloodGlucoseSpecimenSource
  ]);
  static const oxygenSaturation = DetailType('com.google.oxygen_saturation', [
    VitalProperty.oxygenSaturation,
    VitalProperty.supplementalOxygenFlowRate,
    VitalProperty.oxygenTherapyAdministrationMode,
    VitalProperty.oxygenSaturationSystem,
    VitalProperty.oxygenSaturationMeasurementMethod
  ]);
  static const bodyTemperature = DetailType('com.google.body.temperature', [
    VitalProperty.bodyTemperature,
    VitalProperty.bodyTemperatureMeasurementLocation
  ]);
  static const cervicalMucus = DetailType('com.google.cervical_mucus',
      [VitalProperty.cervicalMucusTexture, VitalProperty.cervicalMucusAmount]);
  static const cervicalposition = DetailType('com.google.cervical_position', [
    VitalProperty.cervicalPosition,
    VitalProperty.cervicalDilation,
    VitalProperty.cervicalFirmness
  ]);
  static const menstruation =
      DetailType('com.google.menstruation', [VitalProperty.menstrualFlow]);
  static const ovulationTest = DetailType(
      'com.google.ovulation_test', [VitalProperty.ovulationTestResult]);
  static const vaginalSpotting =
      DetailType('com.google.vaginal_spotting', [ActivityProperty.occurrences]);

  const DetailType(String string, List<Property> properties)
      : super(string, properties);
}
