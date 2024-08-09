import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';

class DefaultButton extends StatelessWidget {
  final BuildContext? context;
  final String title;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final Color textColor;
  final Color buttonColor;
  final double textSize;
  final FontWeight fontWeight;
  final bool isLoading;

  const DefaultButton({
    super.key,
    required this.onPress,
    this.width,
    this.height,
    this.title = "Click Me",
    this.textColor = Colors.white,
    this.context,
    this.textSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.buttonColor = AppColors.primaryColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 5.h,
      width: width ?? 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.px),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xff21C4FA),
            // Color(0xff338DFD),
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.secondary,

            // Theme.of(context).colorScheme.primary,
          ],
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(11.px),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blueAccent,
          borderRadius: BorderRadius.circular(11.px),
          onTap: onPress,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: textColor,
                        fontWeight: fontWeight,
                        fontSize: textSize,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
