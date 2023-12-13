import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SomeBloc, States>(
      builder: (context, state) {
        if (state is SomeUpdated) {}
        return Container();
      },
    );
  }
}
