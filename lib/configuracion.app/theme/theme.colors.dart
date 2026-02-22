import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuracion.app/theme/block/theme_block.dart';

extension ThemeColors on AppTheme {

  Color get appBar1 => switch (this) {
    AppTheme.light => const Color.fromARGB(255, 195, 204, 247),
    AppTheme.dark => const Color.fromARGB(255, 107, 104, 104),
    AppTheme.sepia => const Color.fromARGB(255, 112, 36, 0),
    AppTheme.predeterminado => const Color.fromARGB(255, 145, 120, 211),
  };
  Color get appbackgound => switch (this) {
    AppTheme.light => const Color.fromARGB(255, 240, 239, 238),
    AppTheme.dark => const Color.fromARGB(255, 65, 64, 64),
    AppTheme.sepia => const Color.fromARGB(228, 247, 230, 223),
    AppTheme.predeterminado => const Color.fromARGB(255, 217, 210, 226),
  };
  
  Color get apptext => switch (this) {
    AppTheme.light => const Color.fromARGB(255, 10, 10, 10),
    AppTheme.dark => const Color.fromARGB(255, 168, 163, 163),
    AppTheme.sepia => const Color.fromARGB(255, 73, 44, 0),
    AppTheme.predeterminado => const Color.fromARGB(255, 97, 96, 95),
  };
}