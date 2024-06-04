import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceMapper {
  static PositionEntity mapPosition(Position position) {
    //Aqui en este punto podemos probar

    print("Geolocation- Longitud: ${position.longitude}");
    print("Geolocation- Latitude: ${position.latitude}");

    return PositionEntity(
      longitude: position.longitude,
      latitude: position.latitude,
      timestamp: position.timestamp?.millisecondsSinceEpoch
          .toDouble(), // Convertimos a double?
      accuracy: position.accuracy,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      floor: position.floor,
      isMocked: position.isMocked,
    );
  }
}
