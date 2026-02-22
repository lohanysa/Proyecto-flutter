
import 'package:flutter_application_1/configuracion.app/theme/block/theme_block.dart';

const Map<String, Map<String, String>> themeImgen = {
  'logo':{
    'light': 'assets/imagen/Light/logo_biblioteca.PNG', 
    'dark': 'assets/imagen/Dark/logo_biblioteca.PNG',
    'predeterminado': 'assets/imagen/Default/logo_biblioteca.PNG',
    'sepia': 'assets/imagen/Sepia/logo_biblioteca.PNG',  
  }
};

String themeImagePath( String key, AppTheme theme) {
  if (theme == AppTheme.dark) {
    return themeImgen[key]?['dark'] ?? '';
  } else if (theme == AppTheme.light) {
    return themeImgen[key]?['light'] ?? '';
  } else if (theme == AppTheme.sepia) {
    return themeImgen[key]?['sepia'] ?? '';
  } else {  
    return themeImgen[key]?['predeterminado'] ?? '';
  }
}