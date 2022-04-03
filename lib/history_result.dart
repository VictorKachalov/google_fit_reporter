class DeviceType {
  const DeviceType(this.id, this.description);

  final int id;
  final String description;

  DeviceType.from(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'];

  Map<String, dynamic> get map => {
        'id': id,
        'description': description,
      };
}

class Device {
  const Device(this.manufacturer, this.model, this.type, this.uid);

  final String manufacturer;
  final String model;
  final DeviceType type;
  final String uid;

  Device.from(Map<String, dynamic> json)
      : manufacturer = json['manufacturer'],
        model = json['model'],
        type = DeviceType.from(json['type']),
        uid = json['uid'];

  Map<String, dynamic> get map => {
        'manufacturer': manufacturer,
        'model': model,
        'type': type.map,
        'uid': uid,
      };
}

class DataSourceType {
  const DataSourceType(this.id, this.description);

  final int id;
  final String description;

  DataSourceType.from(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'];

  Map<String, dynamic> get map => {
        'id': id,
        'description': description,
      };
}

class DataSource {
  const DataSource(this.appPackageName, this.device, this.streamIdentifier,
      this.streamName, this.type);

  final String appPackageName;
  final Device device;
  final String streamIdentifier;
  final String streamName;
  final DataSourceType type;

  DataSource.from(Map<String, dynamic> json)
      : appPackageName = json['appPackageName'],
        device = Device.from(json['device']),
        streamIdentifier = json['streamIdentifier'],
        streamName = json['streamName'],
        type = DataSourceType.from(json['type']);

  Map<String, dynamic> get map => {
        'appPackageName': appPackageName,
        'device': device.map,
        'streamIdentifier': streamIdentifier,
        'streamName': streamName,
        'type': type.map,
      };
}

class DataType {
  const DataType(this.name);

  final String name;

  DataType.from(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> get map => {
        'name': name,
      };
}

class DataPointEntryFieldFormat {
  const DataPointEntryFieldFormat(this.id, this.description);

  final int id;
  final String description;

  DataPointEntryFieldFormat.from(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'];

  Map<String, dynamic> get map => {
        'id': id,
        'description': description,
      };
}

class DataPointEntryField {
  const DataPointEntryField(this.name, this.format, this.isOptional);

  final String name;
  final DataPointEntryFieldFormat format;
  final bool? isOptional;

  DataPointEntryField.from(Map<String, dynamic> json)
      : name = json['name'],
        format = DataPointEntryFieldFormat.from(json['value']),
        isOptional = json['isOptional'];

  Map<String, dynamic> get map => {
        'name': name,
        'format': format.map,
        'isOptional': isOptional,
      };
}

class DataPointEntryValue {
  const DataPointEntryValue(this.format, this.isSet, this.activity,
      this.integer, this.float, this.string);

  final DataPointEntryFieldFormat format;
  final bool isSet;
  final String? activity;
  final int? integer;
  final double? float;
  final String? string;

  DataPointEntryValue.from(Map<String, dynamic> json)
      : format = DataPointEntryFieldFormat.from(json['format']),
        isSet = json['isSet'],
        activity = json['activity'],
        integer = json['integer'],
        float = json['float'],
        string = json['string'];

  Map<String, dynamic> get map => {
        'format': format.map,
        'isSet': isSet,
        'activity': activity,
        'integer': integer,
        'float': float,
        'string': string,
      };
}

class DataPointEntry {
  const DataPointEntry(this.field, this.value);

  final DataPointEntryField field;
  final DataPointEntryValue value;

  DataPointEntry.from(Map<String, dynamic> json)
      : field = DataPointEntryField.from(json['field']),
        value = DataPointEntryValue.from(json['value']);

  static List<DataPointEntry> collect(List<dynamic> list) {
    final entries = <DataPointEntry>[];
    for (final Map<String, dynamic> map in list) {
      final entry = DataPointEntry.from(map);
      entries.add(entry);
    }
    return entries;
  }

  Map<String, dynamic> get map => {
        'field': field.map,
        'value': value.map,
      };
}

class DataPoint {
  const DataPoint(
      this.startTime, this.endTime, this.originalDataSource, this.entries);

  final int startTime;
  final int endTime;
  final DataSource originalDataSource;
  final List<DataPointEntry> entries;

  DataPoint.from(Map<String, dynamic> json)
      : startTime = json['startTime'],
        endTime = json['endTime'],
        originalDataSource = DataSource.from(json['dataPoints']),
        entries = DataPointEntry.collect(json['entries']);

  static List<DataPoint> collect(List<dynamic> list) {
    final dataPoints = <DataPoint>[];
    for (final Map<String, dynamic> map in list) {
      final dataPoint = DataPoint.from(map);
      dataPoints.add(dataPoint);
    }
    return dataPoints;
  }

  Map<String, dynamic> get map => {
        'startTime': startTime,
        'endTime': endTime,
        'originalDataSource': originalDataSource.map,
        'entries': entries.map((e) => e.map).toList(),
      };
}

class HistoryResult {
  const HistoryResult(this.dataSource, this.dataType, this.dataPoints);

  final DataSource dataSource;
  final DataType dataType;
  final List<DataPoint> dataPoints;

  HistoryResult.from(Map<String, dynamic> json)
      : dataSource = DataSource.from(json['dataSource']),
        dataType = DataType.from(json['dataType']),
        dataPoints = DataPoint.collect(json['dataPoints']);

  Map<String, dynamic> get map => {
        'dataSource': dataSource.map,
        'dataType': dataType.map,
        'dataPoints': dataPoints.map((e) => e.map).toList(),
      };
}
