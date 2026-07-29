import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:sgsd_core/core/config/environment_config.dart';
import 'package:sgsd_core/core/di/injection.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  EnvironmentConfig config,
  FutureOr<Widget> Function() builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  _validateSecrets(config);

  Bloc.observer = const AppBlocObserver();

  getIt.registerSingleton<EnvironmentConfig>(config);
  await configureDependencies();

  runApp(await builder());
}

// fail loudly on a bad/missing env/*.json
void _validateSecrets(EnvironmentConfig config) {
  if (config.goRestToken.isEmpty) {
    throw StateError(
      'GOREST_TOKEN is empty. Set it in env/${config.environment.name}.json.',
    );
  }
}
