import 'package:coding_assistant_flutter/core/constants/image_assets.dart';
import 'package:coding_assistant_flutter/ui/auth_screens.dart/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_strings.dart';
import '../../routes/routes_names.dart';

AppBar reusableAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    // backgroundColor: Theme.of(context).colorScheme.primary,
    title: Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Text(
        AppStrings.appTitle,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: const Color(0xFFA9B1D6),
            ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 24),
        child: IconButton(
          onPressed: () async {
            await context.read<AuthProvider>().signOut();
            if (!context.mounted) return;
            Navigator.pushNamed(
              context,
              RoutesName.loginscreen,
            );
          },
          icon: const Icon(
            Icons.person_2_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ],
    flexibleSpace: Container(
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
          colors: <Color>[
            Color(0xFF4D619C),
            Color(0xFF1B2236),
          ],
        ),
      ),
    ),
  );
}
