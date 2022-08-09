part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode? themeMode;

  const ThemeState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];

  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode == ThemeMode.light? 'light' : 'dark',
    };
  }

  factory ThemeState.fromJson(Map<String, dynamic> map) {
    return ThemeState(
      themeMode: map['themeMode'] == 'light'? ThemeMode.light : ThemeMode.dark,
    );
  }
}
