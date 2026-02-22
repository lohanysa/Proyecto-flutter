import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuracion.app/theme/block/theme_block.dart';
import 'package:flutter_application_1/configuracion.app/theme/theme.colors.dart';

/// Clase CustomTheme que define los estilos visuales de cada tema
/// Esta clase toma el tipo de tema seleccionado y retorna un ThemeData
/// con los colores y estilos correspondientes
class CustomTheme {
  final AppTheme currentTheme;  // El tema actual seleccionado (light, dark, sepia, etc)
  final double fontSize;        // Factor de escala de fuente (1.0 por defecto)
  final ThemeData basethemeData = ThemeData();  // Tema base de Flutter

  CustomTheme({
    required this.currentTheme,
    this.fontSize = 1.0,
  });

  /// Retorna un ThemeData personalizado según el tema seleccionado
  /// Cada caso del switch define los colores y estilos del tema
  ThemeData getThemeData() {
    switch (currentTheme) {
      // Tema predeterminado: naranja claro (depende del brillo del sistema)
      case AppTheme.predeterminado:
        return basethemeData.copyWith(
          appBarTheme: AppBarTheme(backgroundColor: currentTheme.appBar1),
          scaffoldBackgroundColor: currentTheme.appbackgound,
           textTheme: TextTheme(
            bodyMedium: TextStyle(color: currentTheme.apptext),
          ),
        );
      // Tema claro: fondo blanco con AppBar azul
      case AppTheme.light:
        return basethemeData.copyWith(
          appBarTheme: AppBarTheme(backgroundColor: currentTheme.appBar1),
          scaffoldBackgroundColor: currentTheme.appbackgound,
           textTheme: TextTheme(
            bodyMedium: TextStyle(color: currentTheme.apptext),
          ),
        );
        
      // Tema oscuro: fondo negro con AppBar negro
      case AppTheme.dark:
        return basethemeData.copyWith(
          appBarTheme: AppBarTheme(backgroundColor: currentTheme.appBar1),
          scaffoldBackgroundColor: currentTheme.appbackgound,
           textTheme: TextTheme(
            bodyMedium: TextStyle(color: currentTheme.apptext),
          ),
        );
      // Tema sepia: colores cálidos (fondo crema, AppBar marrón)
      case AppTheme.sepia:
       return basethemeData.copyWith(
          appBarTheme: AppBarTheme(backgroundColor: currentTheme.appBar1),
          scaffoldBackgroundColor: currentTheme.appbackgound,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: currentTheme.apptext),
          ),  
        );
    }
  }
}