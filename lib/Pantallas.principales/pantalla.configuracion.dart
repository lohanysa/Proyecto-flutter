import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/configuracion.app/theme/app.theme.dart';
import 'package:flutter_application_1/configuracion.app/theme/block/theme_block.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/configuracion.app/pantalla.temas.dart';

/// Pantalla principal que configura el sistema de temas con BLoC
/// El BLoC gestiona el estado del tema y lo persiste en SharedPreferences
class configuracion extends StatelessWidget {
  const configuracion({super.key});
  
 @override
  Widget build(BuildContext context) {
    // BlocProvider: proporciona el ThemeBloc a todos los widgets descendientes
    return BlocProvider(
      create: (context) => ThemeBloc(),  // Crea una nueva instancia del ThemeBloc
      child: MaterialApp(
        title: 'Flutter Demo',
        // El builder se ejecuta cada vez que el BLoC emite un nuevo estado
        builder: (context, child) {
          // Obtiene el factor de escala de texto del dispositivo
          TextScaler textScaler = MediaQuery.of(context).textScaler;

          // BlocBuilder: escucha los cambios de estado del ThemeBloc
          // Reconstruye este widget cuando el tema cambia
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              // Variable para determinar si el tema debe ser oscuro
              // (se usa para la lógica de selección de imágenes)
              bool isDark;

              // Lógica: determinar si el tema visual es oscuro o claro
              if (themeState.currentTheme  == AppTheme.predeterminado) {
                // Si es predeterminado, usa el brillo del sistema del dispositivo
                isDark = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
              } else if (themeState.currentTheme == AppTheme.dark) {
                // Si está seleccionado "Dark", es definitivamente oscuro
                isDark = true;
              } else {
                // Para Light y Sepia, es claro
                isDark = false;
              }

              // Crea una instancia de CustomTheme con el tema actual
              // CustomTheme genera un ThemeData personalizado basado en el tema seleccionado
              var customAppTheme = CustomTheme(
                currentTheme: themeState.currentTheme,  // El tema actual del BLoC
                fontSize: 1.0,  // Factor de escala de fuente (puede ajustarse)
              );

              // Theme widget: aplica el tema a todos los widgets descendientes
              // getThemeData() retorna los colores y estilos según el tema seleccionado
              return Theme(
                data: customAppTheme.getThemeData(),  // Aplica los estilos del tema
                child: child!,  // El resto de la app recibe estos estilos
              );
            },
          );
        },
        // ThemaPantalla: la pantalla principal con los checkboxes para cambiar tema
        home: const ThemaPantalla(),
      ),
    );
  }
}
/* esta pantalla se supone que para cambiarle el tema a la aplicacion, es todo un proceso  */