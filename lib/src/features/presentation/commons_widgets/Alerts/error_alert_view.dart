import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog(
      {required BuildContext context,
      required String subtitle,
      dynamic Function()? ctaButtonAction}) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SizedBox(
              height: 320,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/errorIcon.png'),
                    width: 130,
                    height: 130,
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text(
                      'Network error',
                      style: TextStyle(color: accentColor, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                          color: accentColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  createButton(
                      context: context,
                      labelButton: 'Ir a inicio',
                      buttonColor: orange,
                      shape: const StadiumBorder(),
                      func: ctaButtonAction)
                ],
              ),
            ),
          );
        });
  }
}
