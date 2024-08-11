import 'package:flutter/material.dart';
import '../../core/constants/screen_utils.dart';
import 'average_solve_states_widget.dart';
import 'customer_states_widget.dart';

class StatesWidget extends StatelessWidget {
  const StatesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const CustomerStatesWidget(),
          kWidth(24),
          const AverageSolveWidget(),
        ],
      ),
    );
  }
}
