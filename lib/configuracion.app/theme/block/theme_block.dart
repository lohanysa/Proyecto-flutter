import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';
part 'theme_events.dart';

/// ThemeBloc: gestor de estado del tema usando el patrón BLoC
/// Se encarga de:
/// 1. Recibir eventos de cambio de tema
/// 2. Guardar el tema seleccionado en SharedPreferences (persistencia)
/// 3. Emitir nuevos estados para que los widgets se reconstruyan
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String key = 'currentTheme';  // Clave para guardar en SharedPreferences
  
  ThemeBloc() : super(const ThemeState()) {
    // Registra los manejadores de eventos
    on<EventChangeTheme>(onChangeTheme);  // Evento para cambiar tema
    on<EventLoadSavedTheme>(onLoadSavedTheme);  // Evento para cargar tema guardado
  }
  
  /// Maneja el evento de cambio de tema
  /// 1. Guarda el nuevo tema en SharedPreferences (persistencia)
  /// 2. Emite un nuevo estado con el tema actualizado
  /// 3. Los widgets escuchadores se reconstruyen automáticamente
  void onChangeTheme(EventChangeTheme event, Emitter<ThemeState> emit) async {
    final prefs = await (SharedPreferences.getInstance());
    // Guarda el nombre del tema para que persista entre sesiones
    prefs.setString(key, event.currentTheme.name);
    // Emite el nuevo estado con el tema seleccionado
    emit(state.copyWith(currentTheme: event.currentTheme));
  
  }

  /// Carga el tema guardado anteriormente (al iniciar la app)
  /// 1. Lee el tema guardado de SharedPreferences
  /// 2. Si existe, lo usa; si no, usa el tema predeterminado
  /// 3. Emite el estado con el tema cargado
  void onLoadSavedTheme(EventLoadSavedTheme event, Emitter<ThemeState> emit) async {
    final prefs = await (SharedPreferences.getInstance());
    final savedThemeName = prefs.getString(key);
    if (savedThemeName != null) {
      // Convierte el nombre del tema guardado en un valor enum
      emit(state.copyWith(currentTheme: AppTheme.values.firstWhere((theme) => theme.name == savedThemeName)));
    } else {
      // Si no hay tema guardado, usa el tema predeterminado
      emit(state.copyWith(currentTheme: AppTheme.predeterminado));
    }

  }
}