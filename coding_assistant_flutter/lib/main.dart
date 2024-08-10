import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'core/constants/colors.dart';
import 'core/constants/text_styles.dart';
import 'routes/routes.dart';
import 'routes/routes_names.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        textTheme: AppTextStyles.textTheme,
      ),
      initialRoute: RoutesName.homescreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
