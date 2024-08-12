import 'package:flutter/material.dart';
import '../widgets/home_screen_upper.dart';
import '../widgets/reusable_appbar.dart';
import '../widgets/states_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool floatExtended = false;
    return Scaffold(
      appBar: reusableAppBar(context),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme.brightness == Brightness.dark
                ? const <Color>[
                    Color(0xFF1A1B26),
                    Color(0xFF1B2236),
                  ]
                : const <Color>[
                    Color(0xFFFAFAFA),
                    Color(0xFFECECEC),
                  ],
          ),
        ),
        child: const Column(
          children: [
            HomeScreenUpperWidget(),
            StatesWidget(),
            // Switch(
            //   value: themeProvider.isDarkMode,
            //   onChanged: (value) {
            //     themeProvider.toggleTheme(value);
            //   },
            // ),
            // Text(
            //   themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
            //   style: textTheme.bodyMedium,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Create Card',
        label: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.library_add_check)),

            // Text('1'),
            // Text('2'),
            // Text('3'),
          ],
        ),
        isExtended: floatExtended,
        icon: Icon(
          floatExtended == true ? Icons.close : Icons.radio_button_on,
          color: floatExtended == true ? Colors.red : Colors.black,
        ),
        onPressed: () {},
        backgroundColor: floatExtended == true
            ? Colors.blueGrey
            : Colors.white.withOpacity(.7),
      ),
    );
  }
}
