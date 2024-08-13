import 'package:coding_assistant_flutter/core/constants/screen_utils.dart';
import 'package:coding_assistant_flutter/ui/auth_screens.dart/auth_vm.dart';
import 'package:coding_assistant_flutter/ui/widgets/default_button.dart';
import 'package:coding_assistant_flutter/ui/widgets/default_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/image_assets.dart';
import '../../routes/routes_names.dart';
import '../widgets/login_with_google.dart';
import '../widgets/row_with_text.dart';
import '../widgets/welcome_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _loading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                    horizontal: 140,
                    vertical: 100,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: const Color(0xFFA9B1D6),
                                ),
                      ),
                      kHeight(48),
                      DefaultTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      kHeight(16),
                      DefaultTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_clock_outlined,
                      ),
                      kHeight(36),
                      DefaultButton(
                        isLoading: _loading.value,
                        title: 'Sign In',
                        height: 52,
                        width: 125,
                        onPress: () async {
                          _loading.value = true;
                          await authProvider.signInWithEmail(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (!context.mounted) return;
                          if (authProvider.user != null) {
                            Navigator.pushNamed(
                              context,
                              RoutesName.homescreen,
                            );
                            _loading.value = false;
                          }
                        },
                      ),
                      kHeight(36),
                      const RowWithTextBtw(),
                      kHeight(36),
                      const LoginWithGoogle(
                        text1: 'Sign In with',
                      ),
                      kHeight(24),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Don't have account? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.signup,
                                  );
                                },
                              text: 'Sign Up',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
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
