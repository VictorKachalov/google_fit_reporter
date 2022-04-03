import 'property.dart';

class VitalProperty extends Property {
  static const bloodPressureSystolic = VitalProperty('blood_pressure_systolic');
  static const bloodPressureSystolicAverage =
      VitalProperty('blood_pressure_systolic_average');
  static const bloodPressureSystolicMin =
      VitalProperty('blood_pressure_systolic_min');
  static const bloodPressureSystolicMax =
      VitalProperty('blood_pressure_systolic_max');
  static const bloodPressureDiastolic =
      VitalProperty('blood_pressure_diastolic');
  static const bloodPressureDiastolicAverage =
      VitalProperty('blood_pressure_diastolic_average');
  static const bloodPressureDiastolicMin =
      VitalProperty('blood_pressure_diastolic_min');
  static const bloodPressureDiastolicMax =
      VitalProperty('blood_pressure_diastolic_max');
  static const bodyPosition = VitalProperty('body_position');
  static const bloodPressureMeasurementLocation =
      VitalProperty('blood_pressure_measurement_location');
  static const bloodGlucoseLevel = VitalProperty('blood_glucose_level');
  static const temporalRelationToMeal =
      VitalProperty('temporal_relation_to_meal');
  static const temporalRelationToSleep =
      VitalProperty('temporal_relation_to_sleep');
  static const bloodGlucoseSpecimenSource =
      VitalProperty('blood_glucose_specimen_source');
  static const oxygenSaturation = VitalProperty('oxygen_saturation');
  static const oxygenSaturationAverage =
      VitalProperty('oxygen_saturation_average');
  static const oxygenSaturationMin = VitalProperty('oxygen_saturation_min');
  static const oxygenSaturationMax = VitalProperty('oxygen_saturation_max');
  static const supplementalOxygenFlowRate =
      VitalProperty('supplemental_oxygen_flow_rate');
  static const supplementalOxygenFlowRateAverage =
      VitalProperty('supplemental_oxygen_flow_rate_average');
  static const supplementalOxygenFlowRateMin =
      VitalProperty('supplemental_oxygen_flow_rate_min');
  static const supplementalOxygenFlowRateMax =
      VitalProperty('supplemental_oxygen_flow_rate_max');
  static const oxygenTherapyAdministrationMode =
      VitalProperty('oxygen_therapy_administration_mode');
  static const oxygenSaturationSystem =
      VitalProperty('oxygen_saturation_system');
  static const oxygenSaturationMeasurementMethod =
      VitalProperty('oxygen_saturation_measurement_method');
  static const bodyTemperature = VitalProperty('body_temperature');
  static const bodyTemperatureMeasurementLocation =
      VitalProperty('body_temperature_measurement_location');
  static const cervicalMucusTexture = VitalProperty('cervical_mucus_texture');
  static const cervicalMucusAmount = VitalProperty('cervical_mucus_amount');
  static const cervicalPosition = VitalProperty('cervical_position');
  static const cervicalDilation = VitalProperty('cervical_dilation');
  static const cervicalFirmness = VitalProperty('cervical_firmness');
  static const menstrualFlow = VitalProperty('menstrual_flow');
  static const ovulationTestResult = VitalProperty('ovulation_test_result');

  const VitalProperty(String string) : super(string);
}
