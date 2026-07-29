// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sgsd_core/app/app.dart';
import 'package:sgsd_core/core/di/injection.dart';
import 'package:sgsd_core/features/dispatch/presentation/cubit/dispatch_cubit.dart';
import 'package:sgsd_core/features/dispatch/presentation/cubit/dispatch_state.dart';
import 'package:sgsd_core/features/dispatch/presentation/view/dispatch_list_page.dart';

class _MockDispatchCubit extends MockCubit<DispatchState>
    implements DispatchCubit {}

void main() {
  group('App', () {
    late DispatchCubit cubit;

    setUp(() {
      cubit = _MockDispatchCubit();
      when(() => cubit.state).thenReturn(const DispatchState());
      getIt.registerFactory<DispatchCubit>(() => cubit);
    });

    tearDown(() async {
      await getIt.reset();
    });

    testWidgets('renders DispatchListPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(DispatchListPage), findsOneWidget);
    });
  });
}
