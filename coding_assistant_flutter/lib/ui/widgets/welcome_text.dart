import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.secondaryColor,
              AppColors.primaryColor,
            ],
          ),
        ),
        child: Center(
          child: Text(
            'WELCOME TO OUR AI \nASSISTANT',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
