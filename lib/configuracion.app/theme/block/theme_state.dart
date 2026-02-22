part of 'theme_block.dart';

/// ThemeState: representa el estado actual del tema
/// Extiende Equatable para poder comparar instancias y detectar cambios
class ThemeState extends Equatable {
  final AppTheme currentTheme;  // El tema actualmente seleccionado
  
  // Constructor: recibe el tema actual
  // Si no se proporciona, usa AppTheme.predeterminado por defecto
  const ThemeState({this.currentTheme = AppTheme.predeterminado});
  
  // copyWith: crea una nueva instancia de ThemeState con cambios
  // Si se proporciona un nuevo tema, lo usa; si no, mantiene el actual
  // Esto es necesario para emitir nuevos estados en el BLoC
  ThemeState copyWith({AppTheme? currentTheme}) {
    return ThemeState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
  
  @override
  // props: define qué propiedades se usan para comparar igualdad
  // Si currentTheme cambia, Equatable detecta que es un estado diferente
  // y notifica a los BlocBuilder para que se reconstruyan
  List<Object?> get props => [currentTheme];
}


enum AppTheme {
  light,
  dark,
  predeterminado,
  sepia,
}