import 'dart:math';

const _baseDelay = Duration(seconds: 2);
const _maxDelay = Duration(minutes: 5);
const _maxJitterMs = 500;

Duration backoffDelay(int attempt, {Random? random}) {
  final exponential = _baseDelay * pow(2, attempt - 1);
  final capped = exponential > _maxDelay ? _maxDelay : exponential;
  final jitter = Duration(
    milliseconds: (random ?? Random()).nextInt(_maxJitterMs + 1),
  );
  return capped + jitter;
}
