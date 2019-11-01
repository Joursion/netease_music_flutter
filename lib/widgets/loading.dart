import 'package:flutter/cupertino.dart';

class Loading {
  static bool isLoading = false;

  static void showLoading(BuildContext context) {
    if (isLoading) {
      return;
    }

    isLoading = true;

    showGeneralDialog(context: context, pageBuilder: (BuildContext ctx, Animation animation, Animation secondaryAnimation) {
      return;
    }).then((v) {
      isLoading = false;
    });
  }

  static void hideLoading(BuildContext context) {
    if (isLoading) {
      Navigator.of(context).pop();
    }
  }
}