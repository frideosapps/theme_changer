import 'package:frideos/frideos_dart.dart';

import 'bloc_provider.dart';
import '../models/theme.dart';

class AppBloc extends BlocBase {
  final theme = StreamedValue<AppTheme>();

  AppBloc() {
    print('-------APP BLOC INIT--------');

    // Send to stream the initial theme
    theme.value = myThemes[0];
  }

  dispose() {
    print('---------APP BLOC DISPOSE-----------');
    theme.dispose();
  }
}
