enum TrackingBand {
  stationary(Duration(seconds: 60)),
  walking(Duration(seconds: 15)),
  cycling(Duration(seconds: 8)),
  driving(Duration(seconds: 4));

  const TrackingBand(this.interval);

  final Duration interval;
}
