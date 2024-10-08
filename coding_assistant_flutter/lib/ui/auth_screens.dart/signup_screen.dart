import 'package:coding_assistant_flutter/core/constants/screen_utils.dart';
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
import 'auth_vm.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                        'SignUp',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: const Color(0xFFA9B1D6),
                                ),
                      ),
                      kHeight(36),
                      DefaultTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                        obsecure: false,
                      ),
                      kHeight(16),
                      DefaultTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_clock_outlined,
                        obsecure: true,
                      ),
                      kHeight(36),
                      DefaultButton(
                        isLoading: _loading.value,
                        title: 'Sign Up',
                        height: 52,
                        width: 125,
                        onPress: () async {
                          _loading.value = true;

                          await authProvider.signUpWithEmail(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (!context.mounted) return;
                          if (authProvider.user != null) {
                            // User signed up for the first time, navigate to HomeScreen
                            Navigator.pushNamed(
                              context,
                              RoutesName.homescreen,
                            );
                            _loading.value = false;
                          } else if (authProvider.errorMessage ==
                              "User already exists. Please sign in.") {
                            // User already exists, navigate to SignInScreen
                            Navigator.pushNamed(
                              context,
                              RoutesName.loginscreen,
                            );
                            _loading.value = false;
                          }

                          //   else {
                          //     setState(() {
                          //       _errorMessage = authProvider.errorMessage;
                          //     });
                          //     _loading.value = false;
                          //   }
                          // },
                        },
                      ),
                      kHeight(36),
                      const RowWithTextBtw(),
                      kHeight(36),
                      const LoginWithGoogle(
                        text1: 'Sign Up with',
                      ),
                      kHeight(24),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Already have account? ",
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
                                    RoutesName.loginscreen,
                                  );
                                },
                              text: 'Sign In',
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
