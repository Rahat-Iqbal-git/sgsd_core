import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';

const _movementThresholdMps2 = 1.2;

bool isMoving(UserAccelerometerEvent event) {
  final magnitude = sqrt(
    event.x * event.x + event.y * event.y + event.z * event.z,
  );
  return magnitude > _movementThresholdMps2;
}
