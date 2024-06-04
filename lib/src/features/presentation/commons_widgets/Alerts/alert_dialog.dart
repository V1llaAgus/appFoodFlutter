import 'package:flutter/material.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';
// AssetImage('assets/images/lock.png'),
//'Your password has been reset' -  "You'll shortly receive an email with a code to setup a new password."
// 'Done'

//HEADER TEXT
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

void showAlertDialog(
  BuildContext context,
  ImageProvider<Object> imagePath,
  String headerTitle,
  String headerSubTitle,
  String labelButton,
  Widget doneButton,
) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white, // Establecer el fondo blanco aquí
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: imagePath,
                width: 130,
                height: 130,
              ),
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: headerText(
                      texto: headerTitle, color: orange, fontSize: 20.0)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  headerSubTitle,
                  style: const TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
              ),
              doneButton
            ],
          ),
        ),
      );
    },
  );
}


