class PositionEntity {
  PositionEntity({
    required this.longitude,
    required this.latitude,
    required this.timestamp,
    required this.accuracy,
    required this.altitude,
    required this.heading,
    required this.speed,
    required this.speedAccuracy,
    this.floor,
    this.isMocked = false,
  });

  final double latitude;
  final double longitude;
  final double? timestamp;
  final double accuracy;
  final double altitude;
  final double heading;

  final int? floor;

  final double speed;
  final double speedAccuracy;

  final bool isMocked;
}

enum LocationPermissionStatus {
  denied,

  deniedForever,

  allowed
}
