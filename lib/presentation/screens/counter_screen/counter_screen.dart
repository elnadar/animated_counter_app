import 'package:animated_counter_app/presentation/screens/counter_screen/widgets/animated_circles.dart';
import 'package:animated_counter_app/presentation/screens/counter_screen/widgets/counter_resetter.dart';
import 'package:animated_counter_app/presentation/screens/counter_screen/widgets/counter_slider.dart';
import 'package:animated_counter_app/presentation/screens/counter_screen/widgets/counter_value.dart';
import 'package:animated_counter_app/presentation/screens/counter_screen/widgets/manual_theme_mode_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/cubit/counter_cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedCircles(
                  color: theme.colorScheme.secondary,
                ),
                CounterValue(
                    fontStyle: theme.textTheme.headline1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 94.sp))
              ],
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: SliderTouch(
                  buttonsColor: theme.iconTheme.color!.withOpacity(.7),
                  dragButtonColor: theme.colorScheme.secondary,
                  iconColor: theme.iconTheme.color!.withOpacity(.7),
                  onToStart: () =>
                      BlocProvider.of<CounterCubit>(context).decrement(),
                  onToEnd: () =>
                      BlocProvider.of<CounterCubit>(context).increment(),
                )),
            SizedBox(
              height: 18.h,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CounterReset(),
                  ManualThemeModeToggle(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
