import 'package:sgsd_core/app/app.dart';
import 'package:sgsd_core/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
