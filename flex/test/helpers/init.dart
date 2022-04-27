import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'mocks.dart';

final hydratedStorage = MockStorage();

void initHydratedBloc() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HydratedBlocOverrides.runZoned(
    () => null,
    storage: hydratedStorage,
  );
  // HydratedBloc.
}
