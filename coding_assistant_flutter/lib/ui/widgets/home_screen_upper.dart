import 'package:flutter/material.dart';

import '../../core/constants/screen_utils.dart';
import '../../routes/routes_names.dart';
import 'default_button.dart';

class HomeScreenUpperWidget extends StatelessWidget {
  const HomeScreenUpperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.symmetric(
              vertical: 36,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(
                color: const Color(0xFFF0EDFF),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'WELCOME TO OUR AI ASSISTANT',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Where we value getting work done.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                kHeight(24),
                DefaultButton(
                  title: 'Chat Now',
                  height: 52,
                  width: 125,
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.chatscreen,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
