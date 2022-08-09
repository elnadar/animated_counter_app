import 'dart:convert';

import 'package:animated_counter_app/core/themes/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with HydratedMixin {
  ThemeCubit() : super(const ThemeState(themeMode:null))
  {
    if(state.themeMode == null) {
      autoUpdateAppTheme();
    }
  }

  void autoUpdateAppTheme(){
    final Brightness currentBrightness = AppTheme.currentSystemBrightness;
    AppTheme.setStatusBatAndNavigationBarColors(currentBrightness);
    if (currentBrightness == Brightness.light) {
      emit(const ThemeState(themeMode:ThemeMode.light));
    } else{
      emit(const ThemeState(themeMode:ThemeMode.dark));
    }
  }

  void manualUpdateAppTheme(){
    if(state.themeMode == ThemeMode.light){
      AppTheme.setStatusBatAndNavigationBarColors(Brightness.dark);
      emit(const ThemeState(themeMode:ThemeMode.dark));
    } else{
      AppTheme.setStatusBatAndNavigationBarColors(Brightness.light);
      emit(const ThemeState(themeMode:ThemeMode.light));
    }
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }

}
