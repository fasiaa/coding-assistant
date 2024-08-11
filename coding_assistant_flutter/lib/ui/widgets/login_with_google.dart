import 'package:flutter/material.dart';
import '../../core/constants/image_assets.dart';
import '../../core/constants/screen_utils.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        border: Border.all(
          color: const Color(0xFFF0EDFF),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImgAssets.googlelogo,
          ),
          kWidth(12),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Login With ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                TextSpan(
                  text: 'Google',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
