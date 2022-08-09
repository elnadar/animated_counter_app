import 'package:animated_counter_app/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterReset extends StatelessWidget {
  const CounterReset({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.isReset == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Your\'ve reset your counter'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).undoReset();
                }),
          ));
        }
      },
      child: IconButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).reset();
        },
        icon: const Icon(
          Icons.restart_alt,
        ),
        alignment: Alignment.center,
        tooltip: 'Reset',
        iconSize: 28.sp,
      ),
    );
  }
}
