part of 'theme_block.dart';

/// ThemeEvent: clase base para todos los eventos del tema
@immutable
abstract class ThemeEvent {}

/// EventChangeTheme: evento que se dispara cuando el usuario selecciona un tema
/// El BLoC recibe este evento y emite un nuevo estado con el tema actualizado
class EventChangeTheme extends ThemeEvent {
  late final AppTheme currentTheme;  // El tema seleccionado

  EventChangeTheme({required this.currentTheme});
}

/// EventLoadSavedTheme: evento para cargar el tema guardado al iniciar la app
/// Se usa para recuperar la selección del usuario de sesiones anteriores
class EventLoadSavedTheme extends ThemeEvent {

}