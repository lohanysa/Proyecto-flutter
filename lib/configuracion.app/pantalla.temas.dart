import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuracion.app/theme/theme.imgen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/configuracion.app/theme/block/theme_block.dart';

/// Pantalla con los controles para seleccionar el tema
/// Usa CheckboxListTile para mostrar las opciones de tema disponibles
class ThemaPantalla extends StatelessWidget {
  const ThemaPantalla({super.key});
  

   @override
   Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text('Temas de aplicacion'),
       ),
       body: Center(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          // BlocBuilder escucha los cambios del ThemeBloc
          // Cuando el tema cambia, se reconstruye esta lista
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200, 
                  child: Image.asset(
                  themeImagePath('logo', state.currentTheme),
                  fit:BoxFit.contain,
                  )
                ),  
                CheckboxListTile(
                  title: const Text('Predeterminado'),
                  // El checkbox está marcado si el tema actual es 'predeterminado'
                  value: state.currentTheme == AppTheme.predeterminado,
                  onChanged: (_) {
                    // Cuando se cambia, emite un evento al BLoC para cambiar el tema
                    BlocProvider.of<ThemeBloc>(context).add(EventChangeTheme(currentTheme: AppTheme.predeterminado));
                  }
                ),
                // CheckboxListTile para el tema Light (Claro)
                CheckboxListTile(
                  title: const Text('Light'),
                  value: state.currentTheme == AppTheme.light,
                  onChanged: (_) {
                    BlocProvider.of<ThemeBloc>(context).add(EventChangeTheme(currentTheme: AppTheme.light));
                  }
                ),
                // CheckboxListTile para el tema Dark (Oscuro)
                CheckboxListTile(
                  title: const Text('Dark'),
                  value: state.currentTheme == AppTheme.dark,
                  onChanged: (_) {
                    BlocProvider.of<ThemeBloc>(context).add(EventChangeTheme(currentTheme: AppTheme.dark));
                  }
                ),
                // CheckboxListTile para el tema Sepia (Colores cálidos)
                CheckboxListTile(
                  title: const Text('Sepia'),
                  value: state.currentTheme == AppTheme.sepia,
                  onChanged: (_) {
                    BlocProvider.of<ThemeBloc>(context).add(EventChangeTheme(currentTheme: AppTheme.sepia));
                  }
                )
              ]
              );
          }
        )
         )
     );
   }
}