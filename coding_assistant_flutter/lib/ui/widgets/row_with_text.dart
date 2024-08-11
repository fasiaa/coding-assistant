import 'package:flutter/material.dart';

import '../../core/constants/screen_utils.dart';

class RowWithTextBtw extends StatelessWidget {
  const RowWithTextBtw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(),
        ),
        kWidth(12),
        Text(
          "OR",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        kWidth(12),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
