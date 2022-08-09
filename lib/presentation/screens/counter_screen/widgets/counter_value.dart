import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/counter_cubit/counter_cubit.dart';

class CounterValue extends StatelessWidget {
  const CounterValue({
    Key? key,
    required this.fontStyle,
  }) : super(key: key);

  final TextStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      context
          .select<CounterCubit, CounterState>((value) => value.state)
          .counterValue
          .toString(),
      style: fontStyle,
    );
  }
}
