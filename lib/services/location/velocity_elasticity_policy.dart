import 'package:sgsd_core/services/location/tracking_band.dart';

const _rise = [0.7, 4.5, 9.5];
const _fall = [0.3, 3.5, 8.5];

TrackingBand bandFor({
  required double speedMps,
  required TrackingBand current,
}) {
  if (speedMps.isNaN || speedMps < 0) {
    return current;
  }

  var index = current.index;
  while (index < _rise.length && speedMps >= _rise[index]) {
    index++;
  }
  while (index > 0 && speedMps < _fall[index - 1]) {
    index--;
  }
  return TrackingBand.values[index];
}
