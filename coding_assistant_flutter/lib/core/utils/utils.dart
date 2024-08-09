import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui/widgets/default_button.dart';
import '../constants/app_strings.dart';
import '../constants/screen_utils.dart';

abstract class Utils {
  static void okAlertDialog(BuildContext context, String text,
      [VoidCallback? onPress]) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: 28.h,
              width: 90.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 5.w, top: 2.5.h, left: 5.w, bottom: 2.h),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  kHeight(3.h),
                  SizedBox(
                    // width: 45.w,
                    // height: 6.h,
                    child: DefaultButton(
                      onPress: onPress ??
                          () {
                            Navigator.pop(context);
                          },
                      title: AppStrings.ok,
                      // title: "Ok",
                    ),
                  ),
                  kHeight(1.h),
                ],
              ),
            ),
          );
        });
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
