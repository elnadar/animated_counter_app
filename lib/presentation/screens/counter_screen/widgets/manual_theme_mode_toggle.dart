import 'package:animated_counter_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ManualThemeModeToggle extends StatelessWidget {
  const ManualThemeModeToggle({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bool isThemeModeLight =
        context
            .select<ThemeCubit, ThemeState>((value) => value.state)
            .themeMode == ThemeMode.light;
    return IconButton(
      onPressed: () {
        BlocProvider.of<ThemeCubit>(context).manualUpdateAppTheme();
      },
      icon: Icon(isThemeModeLight ? Icons.dark_mode : Icons.light_mode),
      alignment: Alignment.center,
      tooltip: isThemeModeLight ? 'Dark Mode' : 'Light Mode',
      iconSize: 28.sp,
    );
  }
}
