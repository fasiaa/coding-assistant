import 'package:coding_assistant_flutter/core/constants/screen_utils.dart';
import 'package:coding_assistant_flutter/ui/widgets/default_button.dart';
import 'package:coding_assistant_flutter/ui/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import '../../core/constants/image_assets.dart';
import '../../routes/routes_names.dart';
import '../widgets/login_with_google.dart';
import '../widgets/row_with_text.dart';
import '../widgets/welcome_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const WelcomeText(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ImgAssets.bckgrnd,
                  ),
                  repeat: ImageRepeat.repeat,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff4D619C),
                    Color(0xff1B2236),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 80,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFF0EDFF),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(46),
                    ),
                    color: const Color(0x731C1C1C),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'SignUp',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: const Color(0xFFA9B1D6),
                                ),
                      ),
                      kHeight(36),
                      const DefaultTextField(
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      kHeight(16),
                      const DefaultTextField(
                        hintText: 'Password',
                        icon: Icons.lock_clock_outlined,
                      ),
                      kHeight(36),
                      DefaultButton(
                        title: 'Sign Up',
                        height: 52,
                        width: 125,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.homescreen,
                          );
                        },
                      ),
                      kHeight(36),
                      const RowWithTextBtw(),
                      kHeight(36),
                      const LoginWithGoogle()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
