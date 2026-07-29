import 'package:sgsd_core/app/app.dart';
import 'package:sgsd_core/bootstrap.dart';
import 'package:sgsd_core/core/config/environment.dart';
import 'package:sgsd_core/core/config/environment_factory.dart';

Future<void> main() async {
  final config = EnvironmentFactory.create(Environment.staging);
  await bootstrap(config, () => const App());
}
