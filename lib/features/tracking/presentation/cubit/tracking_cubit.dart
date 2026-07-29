import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/services/location/tracking_engine.dart';

@injectable
class TrackingCubit extends Cubit<TrackingStatus> {
  TrackingCubit(this._engine) : super(TrackingStatus.stopped) {
    _subscription = _engine.status.listen(emit);
  }

  final TrackingEngine _engine;
  late final StreamSubscription<TrackingStatus> _subscription;

  Future<bool> toggle() async {
    if (state == TrackingStatus.stopped) {
      return _engine.start();
    }
    await _engine.stop();
    return true;
  }

  @override
  Future<void> close() {
    unawaited(_subscription.cancel());
    return super.close();
  }
}
